defmodule Knapsack do
  @doc """
  Return the maximum value that a knapsack can carry.
  """
  @spec maximum_value(items :: [%{value: integer, weight: integer}], maximum_weight :: integer) ::
          integer
  def maximum_value([], _), do: 0
  def maximum_value([item], maximum_weight) do
    if item.weight > maximum_weight, do: 0, else: item.value
  end

  def maximum_value(items, maximum_weight) do
    items
    |> Enum.reject(&(&1.weight > maximum_weight)) # Less items means fewer combinations to calculate
    |> make_combinations_of_any_size
    |> Enum.map(&sum_value_and_weight/1)
    |> Enum.reject(&(&1.weight > maximum_weight)) # Now we ditch combinations that are to heavy
    |> Enum.max_by(&(&1.value))
    |> Map.get(:value)
  end

  defp sum_value_and_weight(items) do
    Enum.reduce(items, fn item, acc -> %{value: acc.value + item.value, weight: acc.weight + item.weight} end)
  end

  defp make_combinations_of_any_size(items) do
    1..length(items)
    |> Enum.reduce([], fn size, acc -> acc ++ combinations(items, size) end)
  end

  defp combinations(_, 0), do: [[]]
  defp combinations([], _), do: []
  defp combinations([head|tail], size) do
    # ngl, I got this somewhere after trying for more than an hour.. 
    (for y <- combinations(tail, size - 1), do: [head|y]) ++ combinations(tail, size)
  end
end
