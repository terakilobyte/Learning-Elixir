defmodule Teenager do
  def hey(input) do
    input = String.replace(input, ~r/[0-9]/, "", global: true)
    input = String.strip(input || "")

    cond do
      flimflam?(input) ->
        "Fine. Be that way!"

      question?(input) ->
        "Sure."

      forceful?(input) ->
        "Whoa, chill out!"

      true ->
        "Whatever."
    end
  end

  defp flimflam?(input) do
    input == ""
  end

  defp question?(input) do
    String.ends_with?(input, "?")
  end

  defp forceful?(input) do
    "" != String.strip(String.replace(input, ~r/,/, "", global: true)) 
    && input == String.upcase(input)
  end
end
