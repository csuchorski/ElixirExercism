defmodule Username do
  def sanitize(username, built_name \\ [])

  def sanitize('', built_name) do
    built_name |> Enum.reverse()
  end

  def sanitize(username, built_name) do
    # ä becomes ae
    # ö becomes oe
    # ü becomes ue
    # ß becomes ss
    [first | tail] = username

    case first do
      first when first >= ?a and first <= ?z ->
        sanitize(tail, [first | built_name])

      ?_ ->
        sanitize(tail, [first | built_name])

      ?ä ->
        sanitize(tail, [?e, ?a] ++ built_name)

      ?ö ->
        sanitize(tail, [?e, ?o] ++ built_name)

      ?ü ->
        sanitize(tail, [?e, ?u] ++ built_name)

      ?ß ->
        sanitize(tail, [?s, ?s] ++ built_name)

      _ ->
        sanitize(tail, built_name)
    end
  end
end
