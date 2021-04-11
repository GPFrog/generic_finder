defmodule GenericFinderServer.Repo do
  use Ecto.Repo,
    otp_app: :generic_finder_server,
    adapter: Ecto.Adapters.MyXQL
end
