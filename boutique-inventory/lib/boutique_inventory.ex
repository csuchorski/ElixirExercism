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
    # new_sizes
    # %{item | quantity_by_size: new_sizes}
  end

  def total_quantity(item) do
    # Please implement the total_quantity/1 function
  end
end
