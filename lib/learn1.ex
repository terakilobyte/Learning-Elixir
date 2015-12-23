defmodule Learn1 do

  @doc"""
  Calculates fizzbuzz and returns a list of the results

  Examples:

  iex> Learn1.fizzbuzz(5)
  ["1", "2", "fizz", "4", "buzz"]
  """

  def fizzbuzz(range) do
    fizzbuzz 1, range, []
  end

  defp fizzbuzz(n, range, list) when range + 1 === n, do: Enum.reverse list

  defp fizzbuzz(n, range, list) do
    cond do
      rem(n, 3) + rem(n,5) == 0 -> fzbz = "fizzbuzz"
      rem(n, 3) == 0 -> fzbz = "fizz"
      rem(n, 5) == 0 -> fzbz = "buzz"
      true -> fzbz = Integer.to_string n
    end
    fizzbuzz n + 1, range, [fzbz | list]
  end


  @doc"""
  Sums a list

  Examples:

  iex> Learn1.sum([1,2,3,4,5])
  15

  iex> Learn1.sum([2,4,6,8,10])
  30
  """

  def sum(list) when list do
    sum(list, 0)
  end

  defp sum([], total) do
    total
  end

  defp sum([head | tail], total) do
    sum(tail, head + total)
  end

  @doc"""
  Factorializes a number, return :NaN for invalid input

  Examples:

  iex> Learn1.fact(-5)
  :NaN

  iex> Learn1.fact(1)
  1

  iex> Learn1.fact(5)
  120
  """

  def fact(0) do
    1
  end

  def fact(num) when num < 0 do
    :NaN
  end

  def fact(num) do
    fact(num, 1)
  end

  defp fact(1, total) do
    total
  end

  defp fact(num,total) do
    fact(num - 1, num * total)
  end


  @doc"""
  Returns the nth fibonacci number

  Examples:

  iex> Learn1.fib(1)
  1

  iex> Learn1.fib(2)
  1

  iex> Learn1.fib(100)
  354224848179261915075
  """

  @fibs [1, 1]

  def fib(n) do
    cond do
      n == 1 ->
        1
      n == 2 ->
        1
      true ->
        fibs(@fibs, n - 2)
    end
  end

  defp fibs([h|_], 0) do
    h
  end

  defp fibs([h|t], n) do
    fibs([h + List.first(t) | [h]], n - 1)
  end

  @doc"""
  A better fib generator
  iex> Learn1.better_fib(3)
  [0, 1, 1]
  """

  def better_fib(how_many) do
    Stream.unfold({0, 1}, fn {fib1, fib2} -> {fib1, {fib2, fib1 + fib2}} end)
    |> Enum.take(how_many)
  end

  @doc"""
  Returns x raised to the nth power

  Examples:

  iex>
  Learn1.pow(4, 10)
  1048576
  """

  def pow(_, 0), do: 1

  def pow(x, n) do
    val = x * x
    pow(val, x, n - 1)
  end

  defp pow(val, x, 1) do
    val
    |> Integer.to_string
    |> String.length
  end

  defp pow(val, x, n) do
    pow(val * x, x, n - 1)
  end

end
