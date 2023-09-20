defmodule BeerSong do
  @doc """
  Get a single verse of the beer song
  """
  @spec verse(integer) :: String.t()
  def verse(number) do
    """
    #{String.capitalize(bottles(number))} on the wall, #{bottles(number)}.
#{third_part(number)}, #{bottles(number - 1)} on the wall.
    """
  end

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t()) :: String.t()
  def lyrics(range \\ 99..0) do
    range
    |> Enum.map(fn verse_number -> verse(verse_number) end)
    |> Enum.join("\n")
  end

  defp bottles(number) when number == 0 do
    "no more bottles of beer"
  end

  defp bottles(number) when number == -1 do
    "99 bottles of beer"
  end

  defp bottles(number) do
    "#{number} bottle#{if number > 1, do: "s"} of beer"
  end

  defp third_part(number) when number == 0 do
    "Go to the store and buy some more"
  end

  defp third_part(number) do
    "Take #{if number > 1, do: "one", else: "it"} down and pass it around"
  end
end
