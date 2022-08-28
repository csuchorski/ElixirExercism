defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    base_charlist = base |> prepare_candidate()

    Enum.filter(candidates, fn word ->
      prepare_candidate(word) != base_charlist &&
        Enum.sort(prepare_candidate(word)) == Enum.sort(base_charlist)
    end)
  end

  defp prepare_candidate(word) do
    word |> String.downcase() |> to_charlist()
  end
end
