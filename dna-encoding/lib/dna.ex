defmodule DNA do
  def encode_nucleotide(code_point) do
    case code_point do
      ?\s ->
        0b0000

      ?A ->
        0b0001

      ?C ->
        0b0010

      ?G ->
        0b0100

      ?T ->
        0b1000
    end
  end

  def decode_nucleotide(encoded_code) do
    case encoded_code do
      0b0000 ->
        ?\s

      0b0001 ->
        ?A

      0b0010 ->
        ?C

      0b0100 ->
        ?G

      0b1000 ->
        ?T
    end
  end

  def encode(charlist, acc \\ <<>>)
  def encode([], acc), do: acc

  def encode(charlist = [first | rest], acc) do
    <<encode_nucleotide(first)::4, encode(rest, acc)::bitstring>>
  end

  def decode(bitstring, acc \\ [])
  def decode(<<>>, acc), do: List.to_string([acc]) |> to_charlist()

  def decode(bitstring, acc) do
    <<first::4, rest::bitstring>> = bitstring
    decode(<<rest::bitstring>>, List.insert_at(acc, -1, decode_nucleotide(first)))
  end
end
