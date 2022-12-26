defmodule Twix do
  alias Twix.DefaultConfig
  alias Twix.Mapping

  def tw(classes) when is_list(classes) do
    Enum.join(classes, " ")
    |> tw()
  end

  def tw(classes) when is_binary(classes) do
    classes
    |> String.trim()
    |> split_classes()
    |> Enum.map(&Mapping.new(&1))
    |> Enum.reverse()
    |> Enum.uniq_by(fn %Mapping{mods: mods, group: group} -> {mods, group} end)
    |> handle_conflicts()
    |> Enum.reverse()
    |> Enum.map(fn %Mapping{base_class: class, mods: mods} ->
      (mods ++ [class]) |> Enum.join(":")
    end)
    |> Enum.join(" ")
  end

  # -- private functions

  defp split_classes(classes) when is_binary(classes) do
    Regex.split(~r/\s+/, classes)
  end

  defp handle_conflicts(mappings) do
    mappings
    |> Enum.reduce(%{classes: [], conflicts: []}, fn %Mapping{mods: mods, group: group} = data,
                                                     acc ->
      class = Enum.join(mods ++ [group], ":")

      case Enum.member?(acc.conflicts, class) do
        true ->
          acc

        false ->
          conflicts =
            group
            |> get_conflicting_class_group_ids()

          %{acc | conflicts: conflicts, classes: acc.classes ++ [data]}
      end
    end)
    |> Map.get(:classes)
  end

  defp get_conflicting_class_group_ids(class) when is_binary(class) do
    try do
      String.to_existing_atom(class)
      |> get_conflicting_class_group_ids()
    rescue
      _e in ArgumentError ->
        [class]
    end
  end

  defp get_conflicting_class_group_ids(class) do
    DefaultConfig.conflicting_class_groups()[class] || []
  end
end
