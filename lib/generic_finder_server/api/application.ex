defmodule GenericFinderServer.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    #이거 추가
    import Supervisor.Spec

    # List all child processes to be supervised
    children = [
      #nodeJS용 추가
      supervisor(NodeJS, [[path: "node", pool_size: 4]]),
      # Start the Ecto repository
      GenericFinderServer.Repo,
      # Start the endpoint when the application starts
      GenericFinderServerWeb.Endpoint
      # Starts a worker by calling: GenericFinderServer.Worker.start_link(arg)
      # {GenericFinderServer.Worker, arg},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: GenericFinderServer.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    GenericFinderServerWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
