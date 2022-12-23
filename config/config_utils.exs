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
        slate: [{Twix.Validate, :is_integer?}],
        gray: [{Twix.Validate, :is_integer?}],
        zinc: [{Twix.Validate, :is_integer?}],
        neutral: [{Twix.Validate, :is_integer?}],
        stone: [{Twix.Validate, :is_integer?}],
        red: [{Twix.Validate, :is_integer?}],
        orange: [{Twix.Validate, :is_integer?}],
        amber: [{Twix.Validate, :is_integer?}],
        yellow: [{Twix.Validate, :is_integer?}],
        lime: [{Twix.Validate, :is_integer?}],
        green: [{Twix.Validate, :is_integer?}],
        emerald: [{Twix.Validate, :is_integer?}],
        teal: [{Twix.Validate, :is_integer?}],
        cyan: [{Twix.Validate, :is_integer?}],
        sky: [{Twix.Validate, :is_integer?}],
        blue: [{Twix.Validate, :is_integer?}],
        indigo: [{Twix.Validate, :is_integer?}],
        violet: [{Twix.Validate, :is_integer?}],
        purple: [{Twix.Validate, :is_integer?}],
        fuchsia: [{Twix.Validate, :is_integer?}],
        pink: [{Twix.Validate, :is_integer?}],
        rose: [{Twix.Validate, :is_integer?}]
      }
    ]
  end
end
