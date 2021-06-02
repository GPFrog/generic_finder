defmodule Worker do
  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, nil)
  end

  def init(_) do
    {:ok, nil}
  end

#  def crawlMedicine({:getMedicine, medKey}, _from, state) do
#    IO.puts("process #{inspect(self)} fetching medicine number: #{medKey}")
#    {:reply, GenericFinderServer.get_med_info(medKey), state}
#  end
#
#  def crawlPharmacy({:getPharmacy, businessNum}, _from, state) do
#    IO.puts("process #{inspect(self)} fetching pharmacy businessNumber: #{businessNum}")
#    {:reply, GenericFinderServer.get_med_info(businessNum), state}
#  end
#198600441
  def handle_call({:square_root, x}, _from, state) do
    IO.puts("process #{inspect(self)} calculating square root of #{x}")
    Process.sleep(1000)
    {:reply, "#{GenericFinderServer.get_med_info(x)}", state}
  end
end