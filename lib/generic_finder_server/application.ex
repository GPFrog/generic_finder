<<<<<<< HEAD
<<<<<<<< HEAD:lib/generic_finder_server/application.ex
=======
>>>>>>> Yeseung
defmodule GenericFinderServer.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  defp poolboy_config do
    [
      name: {:local, :worker},
      worker_module: Worker,
      size: 5,
      max_overflow: 2
    ]
  end

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      GenericFinderServer.Repo,
      # Start the Telemetry supervisor
      GenericFinderServerWeb.Telemetry,
      # Start the PubSub system
#      {Phoenix.PubSub, name: GenericFinderServer.PubSub},
      # Start the Endpoint (http/https)
      GenericFinderServerWeb.Endpoint,
      # Start a worker by calling: GenericFinderServer.Worker.start_link(arg)
      # {GenericFinderServer.Worker, arg}
      :poolboy.child_spec(:worker, poolboy_config())
    ]

    table = :ets.new(:user, [:set, :public, :named_table])

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: GenericFinderServer.Supervisor]
    Supervisor.start_link(children, opts)
    # Supervisor.start_link(children, strategy: :one_for_one)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    GenericFinderServerWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
