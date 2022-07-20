defmodule DateParser do
  def day() do
    "^[0-3]{0,1}[0-9]{1,1}+$"
  end

  def month() do
    "^[01]{0,1}[0-9]{1,1}+$"
  end

  def year() do
    "[0-9]{4,4}"
  end

  def day_names() do
    # Please implement the day_names/0 function
  end

  def month_names() do
    # Please implement the month_names/0 function
  end

  def capture_day() do
    # Please implement the capture_day/0 function
  end

  def capture_month() do
    # Please implement the capture_month/0 function
  end

  def capture_year() do
    # Please implement the capture_year/0 function
  end

  def capture_day_name() do
    # Please implement the capture_day_name/0 function
  end

  def capture_month_name() do
    # Please implement the capture_month_name/0 function
  end

  def capture_numeric_date() do
    # Please implement the capture_numeric_date/0 function
  end

  def capture_month_name_date() do
    # Please implement the capture_month_name_date/0 function
  end

  def capture_day_month_name_date() do
    # Please implement the capture_day_month_name_date/0 function
  end

  def match_numeric_date() do
    # Please implement the match_numeric_date/0 function
  end

  def match_month_name_date() do
    # Please implement the match_month_name_day/0 function
  end

  def match_day_month_name_date() do
    # Please implement the match_day_month_name_date/0 function
  end
end
