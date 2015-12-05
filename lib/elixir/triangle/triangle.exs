defmodule Triangle do
  @type kind :: :equilateral | :isosceles | :scalene

  @doc """
  Return the kind of triangle of a triangle with 'a', 'b' and 'c' as lengths.
  """
  @spec kind(number, number, number) :: { :ok, kind } | { :error, String.t }
  def kind(a, b, c) do
    validate_triangle_input { a, b, c }
  end

  defp validate_triangle_input({ a, b, c }) do
    cond do
      a + b + c !== abs(a) + abs(b) + abs(c) ->
        { :error, "all side lengths must be positive"}

      a * b * c === 0 ->
        { :error, "all side lengths must be positive"}

      test_triangle_equality({ a, b, c }) !== true ->
        { :error, "side lengths violate triangle inequality" }

      true ->
        define_triangle { a, b, c }
    end
  end

  defp test_triangle_equality({ a, b, c }) do
      a + b > c && a + c > b && b + c > a
  end

  defp define_triangle({ a, b, c }) do
    cond do
      length(Enum.filter([a, b], &(&1 === c))) === 2 ->
        { :ok, :equilateral }
      length(Enum.uniq([a, b, c])) === 2 ->
        { :ok, :isosceles }
      true ->
        { :ok, :scalene }
    end
  end
end
