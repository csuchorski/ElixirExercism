defmodule BirdCount do
  def today([]) do
    nil
  end

  def today([today | _rest]) do
    today
  end

  def increment_day_count([today | rest]) do
    [today + 1 | rest]
  end

  def increment_day_count([]) do
    [1]
  end

  def has_day_without_birds?(list) do
    if(list == []) do
      false
    else
      if hd(list) == 0 do
        true
      else
        has_day_without_birds?(tl(list))
      end
    end
  end

  def total(list, counter \\ 0) do
    if(list == []) do
      counter
    else
      total(tl(list), counter + hd(list))
    end
  end

  def busy_days(list, counter \\ 0) do
    if(list == []) do
      counter
    else
      if hd(list) >= 5 do
        busy_days(tl(list), counter + 1)
      else
        busy_days(tl(list), counter)
      end
    end
  end
end
