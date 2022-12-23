defmodule Twix.Mapping do
  defstruct [:base_class, :mods, :group, :important]

  @before_compile Twix.Generator

  def new(base_class, mods, group, important) do
    %__MODULE__{base_class: base_class, mods: mods, group: group, important: important}
  end

  def new(class) do
    {base_class, mods} = build_mods(class)
    {base_class, important} = get_important(base_class)
    group = lookup_group(base_class)

    %__MODULE__{base_class: base_class, mods: mods, group: group, important: important}
  end

  # -- private functions

  defp build_mods(class) do
    Regex.split(~r/:(?![^[]*?\])/, class)
    |> List.pop_at(-1)
  end

  defp get_important("!" <> base_class) do
    {String.slice(base_class, 1..-1), true}
  end

  defp get_important(base_class) do
    {base_class, false}
  end
end
