defmodule CollatzConjecture do
  @doc """
  calc/1 takes an integer and returns the number of steps required to get the
  number to 1 when following the rules:
    - if number is odd, multiply with 3 and add 1
    - if number is even, divide by 2
  """
  @spec calc(input :: pos_integer()) :: non_neg_integer()
  def calc(1), do: 0
  def calc(input), do: calc(input, 0)
  def calc(1, step_count), do: step_count
  def calc(input, step_count) do
    input
    |> run_step()
    |> calc(step_count + 1)
  end

  defp run_step(num) when is_integer(num) and num > 0 and rem(num, 2) == 0, do: div(num, 2)
  defp run_step(num) when is_integer(num) and num > 0, do: num * 3 + 1
end
