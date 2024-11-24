defmodule BirdCount do
  def today([]), do: nil
  def today(list), do: hd(list)

  def increment_day_count([]), do: [1]
  def increment_day_count(list), do: [hd(list) + 1 | tl(list)]

  def has_day_without_birds?(list), do: 0 in list

  def total([]), do: 0
  def total(list), do: hd(list) + total(tl(list))

  def busy_days([]), do: 0
  def busy_days([h | t]) when h >= 5, do: 1 + busy_days(t)
  def busy_days([_ | t]), do: busy_days(t)
end
