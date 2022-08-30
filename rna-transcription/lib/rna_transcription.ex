defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """
  def to_rna(base, built \\ [])

  @spec to_rna([], [char]) :: [char]
  def to_rna([], built) do
    built
  end

  @spec to_rna([char], [char]) :: [char]
  def to_rna([base_first | base_tail], built) do
    case base_first do
      ?G ->
        to_rna(base_tail, built ++ 'C')

      ?C ->
        to_rna(base_tail, built ++ 'G')

      ?T ->
        to_rna(base_tail, built ++ 'A')

      ?A ->
        to_rna(base_tail, built ++ 'U')
    end
  end
end
