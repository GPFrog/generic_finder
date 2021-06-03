defmodule Worker do
  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, nil)
  end

  def init(_) do
    {:ok, nil}
  end

  def handle_call({:medicine, medKey}, _from, state) do
    IO.puts("process #{inspect(self)} fetching medicine number: #{medKey}")
    {:reply, GenericFinderServer.get_med_info(medKey), state}
  end

  def handle_call({:pharmacy, businessNum}, _from, state) do
    IO.puts("process #{inspect(self)} fetching pharmacy businessNumber: #{businessNum}")
    {:reply, GenericFinderServer.get_pharm_info(businessNum), state}
  end
end