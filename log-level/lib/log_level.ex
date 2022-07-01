defmodule LogLevel do
  def to_label(level, legacy?) do
    if((level == 0 or level == 5) and legacy?) do
      :unknown
    else
      case level do
        0 -> :trace
        1 -> :debug
        2 -> :info
        3 -> :warning
        4 -> :error
        5 -> :fatal
        _ -> :unknown
      end
    end
  end

  def alert_recipient(level, legacy?) do
    case to_label(level, legacy?) do
      x when x in [:fatal, :error] ->
        :ops

      :unknown when legacy? ->
        :dev1

      :unknown when legacy? == false ->
        :dev2

      _ ->
        nil
    end
  end
end
