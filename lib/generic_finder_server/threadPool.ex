defmodule GenericFinderServer.ThreadPool do
  @moduledoc """
thread pool과 관련된 기능을 제공
"""

  use Application

  defp poolboy_config do
    [
      name: {:local, :worker},
      worker_module: GenericFinderServer.Worker,
      size: 50,
      max_overflow: 2
    ]
  end

  def start(_type, _args) do
    children = [
      :poolboy.child_spec(:worker, poolboy_config())
    ]

    opts = [strategy: :one_for_one, name: GenericFinderServer.Supervisor]
    Supervisor.start_link(children, opts)
  end
end