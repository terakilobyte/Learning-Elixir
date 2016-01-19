defmodule Roman do
  @doc """
  Convert the number to a roman number.
  """
  @ones %{"0" => "", "1" => "I", "2" => "II", "3" => "III", "4" => "IV", "5" => "V", "6" => "VI", "7" => "VII", "8" => "VIII", "9" => "IX"}
  @tens %{"0" => "", "1" => "X", "2" => "XX", "3" => "XXX", "4" => "XL", "5" => "L", "6" => "LX", "7" => "LXX", "8" => "LXXX", "9" => "XC"}
  @hundos %{"0" => "", "1" => "C", "2" => "CC", "3" => "CCC", "4" => "CD", "5" => "D", "6" => "DC", "7" => "DCC", "8" => "DCCC", "9" => "CM"}
  @kilos %{"0" => "", "1" => "M", "2" => "MM", "3" => "MMM"}

  @spec numerals(pos_integer) :: String.t
  def numerals(number) do
    number
    |> Integer.to_string
    |> String.codepoints
    |> lookup("")
  end

  defp lookup([h|[]], out), do: out <> @ones[h]

  defp lookup([h|t], out) when length(t) == 1 do
    lookup(t, out <> @tens[h])
  end

  defp lookup([h|t], out) when length(t) == 2 do
    lookup(t, out <> @hundos[h])
  end

  defp lookup([h|t], out), do: lookup(t, out <> @kilos[h])

end

