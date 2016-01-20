defmodule Binary do
  @doc """
  Convert a string containing a binary number to an integer.

  On errors returns 0.
  """
  @spec to_decimal(String.t) :: non_neg_integer
  def to_decimal(string) do
    string
    |> validate
    |> String.codepoints
    |> calculate_binary(0)
  end

  defp validate(string) do
    case String.match?(string, ~r{[^01]}) do
      true -> "0"
      _ -> string
    end
  end

  defp calculate_binary([h|[]], result) do
    case String.to_integer(h) do
      1 -> result + 1
      _ -> result
    end
  end

  defp calculate_binary([h|t], result) do
    case String.to_integer(h) do
      1 ->
       calculate_binary(t, :math.pow(2, length(t)) + result)
      _ ->
       calculate_binary(t, result)
    end
  end
end
