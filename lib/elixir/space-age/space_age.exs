defmodule SpaceAge do
  @type planet :: :mercury | :venus | :earth | :mars | :jupiter
                | :saturn | :neptune | :uranus


  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """

  @planet_period %{mercury: 7600543.81992, venus: 19414149.052176, earth: 31557600, mars: 59354032.69008,
                        jupiter: 374355659.124, saturn: 929292362.8848, uranus: 2651370019.3296,
                        neptune: 5200418560.032}


  @spec age_on(planet, pos_integer) :: float
  def age_on(planet, seconds) do
    seconds / @planet_period[planet]
  end
end
# - Earth: orbital period 365.25 Earth days, or 31557600 seconds
# - Mercury: orbital period 0.2408467 Earth years
# - Venus: orbital period 0.61519726 Earth years
# - Mars: orbital period 1.8808158 Earth years
# - Jupiter: orbital period 11.862615 Earth years
# - Saturn: orbital period 29.447498 Earth years
# - Uranus: orbital period 84.016846 Earth years
# - Neptune: orbital period 164.79132 Earth years
