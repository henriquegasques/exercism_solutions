defmodule React do
  use Agent

  @opaque cells :: pid

  @type cell :: {:input, String.t(), any} | {:output, String.t(), [String.t()], fun()}

  @doc """
  Start a reactive system
  """
  @spec new(cells :: [cell]) :: {:ok, pid}
  def new(cells) do
    Agent.start_link(fn ->
      Map.new(cells, fn
        {:input, name, value} -> {name, value}
        {:output, name, input_names, callback} -> {name, {input_names, callback}}
      end)
    end, name: __MODULE__)
  end

  @doc """
  Return the value of an input or output cell
  """
  @spec get_value(cells :: pid, cell_name :: String.t()) :: any()
  def get_value(_cells, cell_name) do
    Agent.get(__MODULE__, fn cells ->
      case Map.get(cells, cell_name) do
        {input_keys, callback} ->
          values = Map.take(cells, input_keys) |> Map.values()
          apply(callback, values)

        value -> value
      end
    end)
  end

  @doc """
  Set the value of an input cell
  """
  @spec set_value(cells :: pid, cell_name :: String.t(), value :: any) :: :ok
  def set_value(_cells, cell_name, value) do
    Agent.update(__MODULE__, fn cells -> %{cells | cell_name => value} end)
  end

  @doc """
  Add a callback to an output cell
  """
  @spec add_callback(
          cells :: pid,
          cell_name :: String.t(),
          callback_name :: String.t(),
          callback :: fun()
        ) :: :ok
  def add_callback(_cells, cell_name, _callback_name, callback) do
    Agent.update(__MODULE__, fn cells -> Map.update!(cells, cell_name, &(put_elem(&1, 1, callback))) end)
  end

  @doc """
  Remove a callback from an output cell
  """
  @spec remove_callback(cells :: pid, cell_name :: String.t(), callback_name :: String.t()) :: :ok
  def remove_callback(cells, cell_name, callback_name) do
  end
end
