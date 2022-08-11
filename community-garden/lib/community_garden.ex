# Use the Plot struct as it is provided
defmodule Plot do
  @enforce_keys [:plot_id, :registered_to]
  defstruct [:plot_id, :registered_to]
end

defmodule CommunityGarden do
  def start(opts \\ []) do
    {:ok, pid} = Agent.start(fn -> {[], 0} end, opts)
  end

  def list_registrations(pid) do
    Agent.get(pid, fn {plots, _index} -> plots end)
  end

  def register(pid, register_to) do
    Agent.get_and_update(pid, fn {plots, index} ->
      new_plot = %Plot{plot_id: index, registered_to: register_to}

      {
        new_plot,
        {[new_plot | plots], index + 1}
      }
    end)

    %Plot{plot_id: pid, registered_to: register_to}
  end

  def release(pid, plot_id) do
    # Agent.update(pid, fn [%Plot{plot_id: plot_id}, rest] -> rest end)
  end

  def get_registration(pid, plot_id) do
    # Please implement the get_registration/2 function
  end
end
