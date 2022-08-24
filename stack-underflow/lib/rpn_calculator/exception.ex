defmodule RPNCalculator.Exception do
  defmodule DivisionByZeroError do
    defexception message: "division by zero occurred"
  end

  defmodule StackUnderflowError do
    defexception message: "stack underflow occurred"

    @impl true
    def exception(value) do
      case value do
        [] ->
          %StackUnderflowError{}

        _ ->
          %StackUnderflowError{
            message: "stack underflow occurred, context: " <> value
          }
      end
    end
  end

  def divide(list) when length(list) < 2 do
    raise StackUnderflowError, "when dividing"
  end

  def divide([0, _]) do
    raise DivisionByZeroError, "division by zero occurred"
  end

  def divide([a, b]) do
    b / a
  end
end
