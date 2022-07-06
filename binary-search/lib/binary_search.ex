defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """

  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search({}, _key) do
    :not_found
  end

  def search(numbers, key) do
    search(numbers, key, 0, tuple_size(numbers) - 1)
  end

  def search(numbers, key, min, max) do
    mid = Kernel.div(min + max, 2)

    cond do
      max < min ->
        :not_found

      key == elem(numbers, mid) ->
        {:ok, mid}

      key < elem(numbers, mid) ->
        search(numbers, key, min, mid - 1)

      key > elem(numbers, mid) ->
        search(numbers, key, mid + 1, max)
    end
  end
end
