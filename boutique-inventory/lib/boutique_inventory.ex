defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    Enum.sort_by(inventory, & &1.price)
  end

  def with_missing_price(inventory) do
    Enum.filter(inventory, fn x -> x.price == nil end)
  end

  def update_names(inventory, old_word, new_word) do
    Enum.map(inventory, fn item ->
      replaced_name = String.replace(item.name, old_word, new_word)
      %{item | name: replaced_name}
    end)
  end

  def increase_quantity(item, count) do
    # creates an updated list of sizes
    updated_sizes_map =
      for {k, v} <- item.quantity_by_size do
        {k, v + count}
      end
      |> Enum.into(%{})

    %{item | quantity_by_size: updated_sizes_map}
  end

  def total_quantity(item) do
    # Please implement the total_quantity/1 function
  end
end
