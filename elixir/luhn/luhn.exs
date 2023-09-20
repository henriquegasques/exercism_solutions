defmodule Luhn do
  @doc """
  Checks if the given number is valid via the luhn formula
  """
  @spec valid?(String.t()) :: boolean
  def valid?(number) do
    with {:ok, number} <- validate_number(number),
         true <- byte_size(number) > 1 do
        number
        |> prepare_list_of_digits
        |> double_every_second_digit
        |> subtract_nine_from_gt_nine
        |> Enum.sum
        |> rem(10) == 0
    else
      _ -> false
    end
  end

  defp prepare_list_of_digits(string) do
    string |> String.to_integer |> Integer.digits
  end

  defp double_every_second_digit(digits) do
    digits |> Enum.map_every(2, &(&1 * 2))
  end

  defp subtract_nine_from_gt_nine(digits) do
    digits |> Enum.map_every(2, &(if &1 > 9, do: &1 - 9, else: &1))
  end

  defp sum_all_digits(digits), do: digits |> Enum.reduce(& &1 + &2)

  defp validate_number(number) do
    number = number |> String.replace(" ", "")
    if Regex.match?(~r/[^0-9]/, number), do: :error, else: {:ok, number}
  end
end
