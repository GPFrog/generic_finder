defmodule GenericFinderServer.Test do
  @timeout 5000

#  def crawl(i) do
#    async_get_medicine_info(i)
#    |> await_and_inspect()
#  end
#
#  defp async_get_medicine_info(i) do
#    Task.async(fn ->
#      :poolboy.transaction(
#        :worker,
#        fn pid -> GenServer.call(pid, {:medicine ,i}) end,
#        @timeout
#      )
#    end)
#  end

  def start(i) do
    async_call_square_root(i)
    |> await_and_inspect()
  end

  defp async_call_square_root(i) do
    Task.async(fn ->
      :poolboy.transaction(
        :worker,
        fn pid -> GenServer.call(pid, {:square_root, i}) end,
        @timeout
      )
    end)
  end

  defp await_and_inspect(task), do: task |> Task.await(@timeout) |> IO.inspect()
end