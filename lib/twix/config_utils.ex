defmodule Twix.ConfigUtils do
  def breaks(), do: ~w(auto avoid all avoid-page page left right column)

  def positions(),
    do: ~w(bottom center left left-bottom left-top right right-bottom right-top top)

  def overflow(), do: ~w(auto hidden clip visible scroll)
  def overscroll(), do: ~w(auto contain none)
  def align(), do: ~w(start end center between around evenly)
  def line_styles(), do: ~w(solid dashed dotted double none)

  def blend_modes(),
    do:
      ~w(normal multiply screen overlay darken lighten color-dodge color-burn hard-light soft-light difference exclusion hue saturation color luminosity plus-lighter)

  def zero_and_empty(), do: ["", "0", {Twix.Validate, :is_arbitrary_value}]

  def colors() do
    [
      "inherit",
      "current",
      "transparent",
      "black",
      "white",
      %{
        slate: [{Twix.Validate, :is_integer?}, {Twix.Validate, :is_opacity?}],
        gray: [{Twix.Validate, :is_integer?}, {Twix.Validate, :is_opacity?}],
        zinc: [{Twix.Validate, :is_integer?}, {Twix.Validate, :is_opacity?}],
        neutral: [{Twix.Validate, :is_integer?}, {Twix.Validate, :is_opacity?}],
        stone: [{Twix.Validate, :is_integer?}, {Twix.Validate, :is_opacity?}],
        red: [{Twix.Validate, :is_integer?}, {Twix.Validate, :is_opacity?}],
        orange: [{Twix.Validate, :is_integer?}, {Twix.Validate, :is_opacity?}],
        amber: [{Twix.Validate, :is_integer?}, {Twix.Validate, :is_opacity?}],
        yellow: [{Twix.Validate, :is_integer?}, {Twix.Validate, :is_opacity?}],
        lime: [{Twix.Validate, :is_integer?}, {Twix.Validate, :is_opacity?}],
        green: [{Twix.Validate, :is_integer?}, {Twix.Validate, :is_opacity?}],
        emerald: [{Twix.Validate, :is_integer?}, {Twix.Validate, :is_opacity?}],
        teal: [{Twix.Validate, :is_integer?}, {Twix.Validate, :is_opacity?}],
        cyan: [{Twix.Validate, :is_integer?}, {Twix.Validate, :is_opacity?}],
        sky: [{Twix.Validate, :is_integer?}, {Twix.Validate, :is_opacity?}],
        blue: [{Twix.Validate, :is_integer?}, {Twix.Validate, :is_opacity?}],
        indigo: [{Twix.Validate, :is_integer?}, {Twix.Validate, :is_opacity?}],
        violet: [{Twix.Validate, :is_integer?}, {Twix.Validate, :is_opacity?}],
        purple: [{Twix.Validate, :is_integer?}, {Twix.Validate, :is_opacity?}],
        fuchsia: [{Twix.Validate, :is_integer?}, {Twix.Validate, :is_opacity?}],
        pink: [{Twix.Validate, :is_integer?}, {Twix.Validate, :is_opacity?}],
        rose: [{Twix.Validate, :is_integer?}, {Twix.Validate, :is_opacity?}]
      }
      |> extend(Application.get_env(:twix, :colors))
    ]
  end

  defp extend(color_map, nil), do: color_map

  defp extend(color_map, config) do
    config
    |> Enum.reduce(color_map, fn color, acc ->
      Map.put(acc, String.to_atom(color), [
        {Twix.Validate, :is_integer?},
        {Twix.Validate, :is_opacity?}
      ])
    end)
  end
end
