defmodule Grains do
  use Bitwise
  @doc """
  Calculate two to the power of the input minus one.
  """
  @spec square(pos_integer) :: pos_integer

  def square(number) do
    cond do
      number === 1 ->
        1
      true ->
        # bitshifting to the left is essential raising to the power of 2
        1 <<< number
    end
  end

  @doc """
  Adds square of each number from 1 to 64.
  """
  @spec total :: pos_integer
  def total do
    # starting from 1 representing the first square
    board_total = 1
    for i <- 1..63, do: board_total = board_total + square(i)
    board_total
  end

  # I opted to go for bitshifting here as it seems to be the fastest.
  # I don't feel I lost in readability
end
