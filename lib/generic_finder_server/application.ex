defmodule GenericFinderServer.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Start the Ecto repository
      GenericFinderServer.Repo,
      # Start the endpoint when the application starts
      GenericFinderServerWeb.Endpoint,
      # Starts a worker by calling: GenericFinderServer.Worker.start_link(arg)
      # {GenericFinderServer.Worker, arg},

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