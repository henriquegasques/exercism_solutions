defmodule Yacht do
  @type category ::
          :ones
          | :twos
          | :threes
          | :fours
          | :fives
          | :sixes
          | :full_house
          | :four_of_a_kind
          | :little_straight
          | :big_straight
          | :choice
          | :yacht

  @doc """
  Calculate the score of 5 dice using the given category's scoring method.
  """
  @spec score(category :: category(), dices :: [integer]) :: integer
  def score(:choice, dices), do: Enum.sum(dices)
  def score(:ones,   dices), do: Enum.count(dices, &(&1 == 1))
  def score(:twos,   dices), do: 2 * Enum.count(dices, &(&1 == 2))
  def score(:threes, dices), do: 3 * Enum.count(dices, &(&1 == 3))
  def score(:fours,  dices), do: 4 * Enum.count(dices, &(&1 == 4))
  def score(:fives,  dices), do: 5 * Enum.count(dices, &(&1 == 5))
  def score(:sixes,  dices), do: 6 * Enum.count(dices, &(&1 == 6))
  def score(:little_straight, dices), do: (if Enum.sort(dices) == [1,2,3,4,5], do: 30, else: 0)
  def score(:big_straight, dices), do: (if Enum.sort(dices) == [2,3,4,5,6], do: 30, else: 0)
  def score(:yacht, dices), do: (if length(Enum.uniq(dices)) == 1, do: 50, else: 0)

  def score(:full_house, dices) do
    case dices |> Enum.frequencies |> Map.values |> Enum.sort do
      [2, 3] -> Enum.sum(dices)
      _ -> 0
    end
  end

  def score(:four_of_a_kind, dices) do
    case dices |> Enum.frequencies |> Enum.max do
      {n, 4} -> 4 * n
      {n, 5} -> 4 * n
      _ -> 0
    end
  end
end
