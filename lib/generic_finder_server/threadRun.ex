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

  def start(i, flag) do
    async_crawl(i, flag)
    |> await_and_inspect()
  end



  defp async_crawl(i, flag) do
    Task.async(fn ->
      :poolboy.transaction(
        :worker,
        fn pid -> GenServer.call(pid, {flag, i}) end,
        @timeout
      )
    end)
  end

  def start(i, j, flag) do
    async_crawl(i, j, flag)
    |> await_and_inspect()
  end

  defp async_crawl(i, j, flag) do
    Task.async(fn ->
      :poolboy.transaction(
        :worker,
        fn pid -> GenServer.call(pid, {flag, i, j}) end,
        @timeout
      )
    end)
  end

  def start(i, j, k, flag) do
    async_crawl(i, j, k, flag)
    |> await_and_inspect()
  end

  defp async_crawl(i, j, k, flag) do
    Task.async(fn ->
      :poolboy.transaction(
        :worker,
        fn pid -> GenServer.call(pid, {flag, i, j, k}) end,
        @timeout
      )
    end)
  end

  def start(i, j, k, l, flag) do
    async_crawl(i, j, k, l, flag)
    |> await_and_inspect()
  end

  defp async_crawl(i, j, k, l, flag) do
    Task.async(fn ->
      :poolboy.transaction(
        :worker,
        fn pid -> GenServer.call(pid, {flag, i, j, k, l}) end,
        @timeout
      )
    end)
  end

  defp await_and_inspect(task), do: task |> Task.await(@timeout) |> IO.inspect()
end