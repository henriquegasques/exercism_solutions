defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(number) when number <= 3,   do: String.duplicate("I", number)
  def numeral(number) when number <= 5,   do: numeral(5 - number) <> "V"
  def numeral(number) when number <= 8,   do: "V"  <> numeral(number - 5)
  def numeral(number) when number <= 10,  do: numeral(10 - number) <> "X"
  def numeral(number) when number <= 39,  do: "X"  <> numeral(number - 10)
  def numeral(number) when number <= 49,  do: "XL" <> numeral(number - 40)
  def numeral(number) when number <= 89,  do: "L"  <> numeral(number - 50)
  def numeral(number) when number <= 99,  do: "XC" <> numeral(number - 90)
  def numeral(number) when number <= 399, do: "C"  <> numeral(number - 100)
  def numeral(number) when number <= 499, do: "CD" <> numeral(number - 400)
  def numeral(number) when number <= 899, do: "D"  <> numeral(number - 500)
  def numeral(number) when number <= 999, do: "CM" <> numeral(number - 900)
  def numeral(number), do: "M" <> numeral(number - 1000)
end
