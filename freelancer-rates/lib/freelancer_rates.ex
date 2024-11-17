defmodule FreelancerRates do
  def daily_rate(hourly_rate), do: hourly_rate * 8.0

  def apply_discount(before_discount, discount) do
    percentage = discount / 100.0
    amount = before_discount * percentage
    before_discount - amount
  end

  def monthly_rate(hourly_rate, discount) do
    discounted_rate = apply_discount(hourly_rate, discount)
    ceil(discounted_rate * 22 * 8)
  end

  def days_in_budget(budget, hourly_rate, discount) do
    daily_discounted_rate = apply_discount(hourly_rate, discount) * 8
    Float.floor(budget / daily_discounted_rate, 1)
  end
end
