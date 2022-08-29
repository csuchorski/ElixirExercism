defmodule Scrabble do
  @doc """
  Calculate the scrabble score for the word.
  """
  @spec score(String.t()) :: non_neg_integer
  def score(word) do
    word
    |> String.upcase()
    |> to_charlist()
    |> Enum.reduce(0, fn letter, acc ->
      acc +
        cond do
          letter in [?A, ?E, ?I, ?O, ?U, ?L, ?N, ?R, ?S, ?T] ->
            1

          letter in [?D, ?G] ->
            2

          letter in [?B, ?C, ?M, ?P] ->
            3

          letter in [?F, ?H, ?V, ?W, ?Y] ->
            4

          letter in [?K] ->
            5

          letter in [?J, ?X] ->
            8

          letter in [?Q, ?Z] ->
            10

          true ->
            0
        end
    end)
  end
end
