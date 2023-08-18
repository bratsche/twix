defmodule Twix.Validate do
  @arbitrary_regex ~r/^\[(.+)\]$/

  def is_opacity?(val) do
    Regex.match?(~r/^\d{2,3}\/\d{1,3}$/, val)
  end

  def is_integer?(val) do
    case Integer.parse(val) do
      {_num, ""} -> true
      _ -> false
    end
  end

  def is_float?(val) do
    case Float.parse(val) do
      {_num, ""} -> true
      _ -> false
    end
  end

  def is_integer_or_arbitrary_value(val) do
    is_integer?(val) || is_arbitrary_value(val)
  end

  def is_arbitrary_value(val) do
    Regex.match?(~r/^\[(.+)\]$/, val)
  end

  def is_tshirt_value(val) do
    Regex.match?(~r/^(\d+)?(xs|sm|md|lg|xl)?$/, val)
  end

  def is_length(val) do
    is_integer?(val) || is_float?(val) || Enum.member?(["px", "full", "screen"], val) ||
      Regex.match?(~r/^\d+\/\d+$/, val) || is_arbitrary_length(val)
  end

  def is_arbitrary_position(val) do
    case Regex.run(@arbitrary_regex, val) do
      nil ->
        false

      [_, str] ->
        String.starts_with?(str, "position:")
    end
  end

  @length_pattern "\\d+(%|px|em|rem|vh|vw|pt|pc|in|cm|mm|cap|ch|ex|lh|rlh|vi|vb|vmin|vmax)"
  @length_regex ~r/#{@length_pattern}/i

  def is_arbitrary_length(val) do
    case Regex.run(@arbitrary_regex, val) do
      nil ->
        false

      [_, str] ->
        String.starts_with?(str, "length:") ||
          Regex.match?(@length_regex, str)
    end
  end

  def is_arbitrary_number(val) do
    case Regex.run(@arbitrary_regex, val) do
      nil ->
        false

      [_, str] ->
        String.starts_with?(str, "number:") || is_integer?(str) || is_float?(str)
    end
  end

  @color_pattern "(#[0-9a-f]{3,6}|rgba\([^)]+\)|amber|black|blue|cyan|emerald|fuchsia|gray|green|indigo|lime|neutral|orange|pink|purple|red|rose|sky|slate|stone|teal|violet|white|yellow|zinc)"
  @shadow_regex ~r/#{@length_pattern}(_+#{@length_pattern})*(#{@color_pattern})?/i

  def is_arbitrary_shadow(val) do
    case Regex.run(@arbitrary_regex, val) do
      nil ->
        false

      [_, shadows] ->
        shadows
        |> String.split(~r/,_*/)
        |> Enum.all?(&Regex.match?(@shadow_regex, &1))
    end
  end

  def is_any(_val), do: true
end
