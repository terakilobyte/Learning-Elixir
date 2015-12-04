defmodule Gigasecond do
	@doc """
	Calculate a date one billion seconds after an input date.
	"""
	@spec from({pos_integer, pos_integer, pos_integer}) :: :calendar.date

	def from({year, month, day}) do
    date = {year, month, day}
    |> get_seconds_from_date
    |> add_gigaseconds
    |> get_date_in_seconds
	end

  defp get_seconds_from_date(from) do
    :calendar.datetime_to_gregorian_seconds({from, {0, 0, 0}})
  end

  defp add_gigaseconds(seconds) do
    seconds + 1_000_000_000
  end

  defp get_date_in_seconds(seconds) do
    {from, _} = :calendar.gregorian_seconds_to_datetime(seconds)
    from
  end
end
