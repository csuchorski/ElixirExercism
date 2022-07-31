defmodule LibraryFees do
  def datetime_from_string(string) do
    NaiveDateTime.from_iso8601!(string)
  end

  def before_noon?(datetime) do
    datetime.hour < 12
  end

  def return_date(checkout_datetime) do
    if before_noon?(checkout_datetime) do
      NaiveDateTime.add(checkout_datetime, 2_419_200) |> NaiveDateTime.to_date()
    else
      NaiveDateTime.add(checkout_datetime, 2_505_600) |> NaiveDateTime.to_date()
    end
  end

  def days_late(planned_return_date, actual_return_datetime) do
    diff = Date.diff(actual_return_datetime, planned_return_date)

    if diff <= 0 do
      0
    else
      diff
    end
  end

  def monday?(datetime) do
    Date.day_of_week(datetime) == 1
  end

  def calculate_late_fee(checkout, return, rate) do
    fee =
      (return_date(datetime_from_string(checkout)) |> days_late(datetime_from_string(return))) *
        rate

    if(monday?(datetime_from_string(return))) do
      div(fee, 2)
    else
      fee
    end
  end
end
