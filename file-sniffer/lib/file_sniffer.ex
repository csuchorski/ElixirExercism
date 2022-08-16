defmodule FileSniffer do
  def type_from_extension(extension) do
    case extension do
      "exe" -> "application/octet-stream"
      "bmp" -> "image/bmp"
      "png" -> "image/png"
      "jpg" -> "image/jpg"
      "gif" -> "image/gif"
    end
  end

  def type_from_binary(file_binary) do
    <<signature::binary-size(1), body::binary>> = file_binary

    cond do
      signature in [<<0x7F>>, <<0x45>>, <<0x4C>>, <<0x46>>] ->
        "application/octet-stream"

      signature in [<<0x42>>, <<0x4D>>] ->
        "image/bmp"

      signature in [
        <<0x89>>,
        <<0x50>>,
        <<0x4E>>,
        <<0x0D>>,
        <<0x0A>>,
        <<0x1A>>,
        <<0x0A>>
      ] ->
        "image/png"

      signature in [<<0xFF>>, <<0xD8>>, <<0xFF>>] ->
        "image/jpg"

      signature in [<<0x47>>, <<0x49>>, <<0x46>>] ->
        "image/gif"
    end
  end

  def verify(file_binary, extension) do
    type_ext = type_from_extension(extension)

    if(type_from_binary(file_binary) == type_ext) do
      {:ok, type_ext}
    else
      {:error, "Warning, file format and file extension do not match."}
    end
  end
end
