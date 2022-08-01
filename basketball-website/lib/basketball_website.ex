defmodule BasketballWebsite do
  def extract_from_path(data, []) do
    data
  end

  def extract_from_path(data, [first | rest]) do
    extract_from_path(data[first], rest)
  end

  def extract_from_path(data, path) do
    [first | rest] = String.split(path, ".")
    extract_from_path(data[first], rest)
  end

  def get_in_path(data, path) when is_binary(path) do
    get_in_path(data, String.split(path, "."))
  end

  def get_in_path(data, list) do
    get_in(data, list)
  end
end
