defmodule FreelancerRates do
  def daily_rate(hourly_rate), do: hourly_rate * 8.0

  def apply_discount(before_discount, discount),
    do: before_discount * (1 - discount / 100)

  def monthly_rate(hourly_rate, discount) do
    discounted_hourly_rate = apply_discount(hourly_rate, discount)
    discounted_daily_rate = daily_rate(discounted_hourly_rate)
    ceil(discounted_daily_rate * 22)
  end

  def days_in_budget(budget, hourly_rate, discount) do
    discounted_hourly_rate = apply_discount(hourly_rate, discount)
    discounted_daily_rate = daily_rate(discounted_hourly_rate)
    Float.floor(budget / discounted_daily_rate, 1)
  end
end
