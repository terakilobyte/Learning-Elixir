defmodule PrimeFactors do
  @doc """
  Compute the prime factors for 'number'.

  The prime factors are prime numbers that when multiplied give the desired
  number.

  The prime factors of 'number' will be ordered lowest to highest. 
  """

  @spec factors_for(1) :: []
  def factors_for(1), do: []

  @spec factors_for(pos_integer) :: [pos_integer]
  def factors_for(number) do
    number
    |> prime_factors(2)
    |> List.flatten
  end


  defp prime_factors(number, test, list \\ []) do
    case rem(number, test) do
      0 ->
        cond do
          div(number, test) == 1 ->
            [list | [test]]
          true ->
            prime_factors(div(number, test), 2, [list | [test]])
        end
      _ ->
        prime_factors(number, test + 1, list)
    end
  end
end
