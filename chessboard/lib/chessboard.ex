defmodule Chessboard do
  def rank_range do
    1..8
  end

  def file_range do
    ?A..?H
  end

  def ranks do
    Enum.to_list(rank_range())
  end

  def files do
    # One way to solve, exercism doesn't like it
    # Enum.to_list(file_range())
    # |> List.to_string()
    # |> String.split("", trim: true)

    Enum.to_list(file_range)
    |> Enum.map(fn code_point ->
      <<code_point>>
    end)
  end
end
