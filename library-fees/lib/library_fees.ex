defmodule LibraryFees do
  def datetime_from_string(string) do
    NaiveDateTime.from_iso8601!(string)
  end

  def before_noon?(datetime) do
    datetime
    |> NaiveDateTime.to_time()
    |> Time.compare(~T[12:00:00]) == :lt
  end

  def return_date(checkout_datetime) do
    days =
      if before_noon?(checkout_datetime) do
        28
      else
        29
      end

    checkout_datetime
    |> NaiveDateTime.add(days * 24 * 60 * 60)
    |> NaiveDateTime.to_date()
  end

  def days_late(planned_return_date, actual_return_datetime) do
    actual_return_datetime
    |> NaiveDateTime.to_date()
    |> Date.diff(planned_return_date)
    |> max(0)
  end

  def monday?(datetime) do
    NaiveDateTime.to_date(datetime)
    |> Date.day_of_week() == 1
  end

  def calculate_late_fee(checkout, return, rate) do
    return_datetime = datetime_from_string(return)

    days_late =
      checkout
      |> datetime_from_string()
      |> return_date()
      |> days_late(return_datetime)

    fee = rate * days_late
    if monday?(return_datetime), do: trunc(fee * 0.5), else: fee
  end
end
