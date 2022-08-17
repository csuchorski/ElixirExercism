defmodule BoutiqueSuggestions do
  def get_combinations(tops, bottoms, options \\ []) do
    options = Keyword.merge([maximum_price: 100], options)

    for top <- tops,
        bottom <- bottoms,
        top[:base_color] != bottom[:base_color],
        top[:price] + bottom[:price] <= options[:maximum_price] do
      {top, bottom}
    end
  end
end
