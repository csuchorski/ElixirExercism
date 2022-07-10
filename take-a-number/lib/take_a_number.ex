defmodule TakeANumber do
  def start() do
    spawn(fn -> loop(0) end)
  end

  defp loop(number) do
    receive do
      {:take_a_number, pid} ->
        send(pid, number + 1)
        loop(number + 1)

      {:report_state, pid} ->
        send(pid, number)
        loop(number)

      :stop ->
        nil

      _ ->
        loop(number)
    end
  end
end
