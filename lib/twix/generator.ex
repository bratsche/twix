defmodule Twix.Generator do
  alias Twix.DefaultConfig

  def split_class(class) do
    Regex.split(~r/-(?![^[]*?\])/, class)
  end

  defp generate_lookups(group_id, group, prefixes \\ [])

  defp generate_lookups(group_id, group, prefixes) when is_map(group) do
    for {k, patterns} <- group do
      prefix =
        prefixes
        |> Enum.map(&to_string/1)
        |> Enum.concat([k])
        |> Enum.join("-")

      is_validator = fn
        {module, fun} when is_atom(module) and is_atom(fun) -> true
        _ -> false
      end

      patterns
      |> Enum.reject(is_validator)
      |> Enum.reduce([], fn validator, current ->
        code =
          case validator do
            map when is_map(map) ->
              generate_lookups(group_id, map, Enum.concat(prefixes, [to_string(k)]))

            "" ->
              quote do
                # Looks up the group id given a simple Tailwind CSS class.
                #
                # ## Examples
                #
                #   iex> lookup_group("aspect-video")
                #   "aspect"
                defp lookup_group(unquote(prefix)) do
                  to_string(unquote(group_id))
                end
              end

            class_name when is_binary(class_name) ->
              quote do
                defp lookup_group(unquote(prefix) <> "-" <> unquote(validator)) do
                  to_string(unquote(group_id))
                end
              end
          end

        [code | current]
      end)
    end
  end

  defp generate_lookups(group_id, group, _prefixes) do
    for class <- group do
      class_list = split_class(class)

      quote do
        # Looks up a group id given a list of class parts.
        #
        # Examples:
        #
        #   iex> get_group_for_class_list(["inline", "block"], "foo")
        #   :display
        #
        defp get_group_for_class_list(unquote(class_list), orig) do
          unquote(group_id)
        end
      end
    end
  end

  defp has_validator?({group_id, group}) when is_list(group) do
    group
    |> Enum.any?(fn
      {module, fun} when is_atom(module) and is_atom(fun) ->
        true

      map when is_map(map) ->
        has_validator?({group_id, map})

      str when is_binary(str) ->
        false
    end)
  end

  defp has_validator?({_group_id, group}) when is_map(group) do
    Enum.any?(group, &has_validator?/1)
  end

  defp build_validator_mapping(group_id, group) do
    Enum.map(group, fn {k, v} ->
      prefixes =
        k
        |> to_string()
        |> String.split("-")

      v
      |> Enum.reject(&is_binary/1)
      |> Enum.map(fn
        {module, fun} when is_atom(module) and is_atom(fun) ->
          {prefixes, group_id, {module, fun}}

        map when is_map(map) ->
          Enum.map(map, fn {k1, v1} ->
            # Really?? Gross
            vlist = Enum.reject(v1, fn x -> is_atom(x) || is_binary(x) end)
            {[k] ++ [k1], group_id, vlist}
          end)
      end)
    end)
  end

  defmacro __before_compile__(_env) do
    validation_mapping =
      DefaultConfig.class_groups()
      |> Enum.filter(&has_validator?/1)
      |> Enum.map(fn {group_id, group} -> build_validator_mapping(group_id, group) end)
      |> List.flatten()
      |> Enum.reduce(%{}, fn {k, group_id, v}, acc ->
        {_, updated_map} =
          Map.get_and_update(acc, k, fn
            nil ->
              {nil, %{group_id => List.flatten([v])}}

            map when is_map(map) ->
              {_, update} =
                Map.get_and_update(map, group_id, fn
                  nil ->
                    {nil, List.flatten([v])}

                  list when is_list(list) ->
                    {list, List.flatten(list ++ [v])}
                end)

              {map, update}
          end)

        updated_map
      end)

    validations =
      for {prefix, validators} <- validation_mapping do
        args =
          prefix
          |> Enum.map(&to_string/1)
          |> Enum.map(&String.split(&1, "-"))
          |> List.flatten()
          |> Enum.map(&to_string/1)
          |> Enum.reverse()
          |> Enum.reduce(
            [
              quote do
                n
              end
            ],
            &[&1 | &2]
          )

        quote do
          defp get_group_for_class_list(unquote(args) = class_list, orig) do
            unquote(Macro.escape(validators))
            |> Enum.find(nil, fn {group_id, validator_list} ->
              Enum.any?(validator_list, fn {module, fun} ->
                apply(module, fun, [n])
              end)
            end)
            |> case do
              {group_id, _validator} ->
                to_string(group_id)

              nil ->
                orig
            end
          end
        end
      end

    groups =
      for {group_id, group} <- DefaultConfig.class_groups() do
        generate_lookups(group_id, group)
      end

    fallback =
      quote do
        defp get_group_for_class_list(class_list, _orig) do
          Enum.join(class_list, "-")
        end

        defp lookup_group(class) do
          class
          |> Twix.Generator.split_class()
          |> get_group_for_class_list(class)
        end
      end

    [groups, validations, fallback]
  end
end
