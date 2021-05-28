# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :generic_finder_server,
  ecto_repos: [GenericFinderServer.Repo]

# Configures the endpoint
config :generic_finder_server, GenericFinderServerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "6DDce4q+UeUeDcUO21cIfNbERgTElqklc2+nj2Y7ixLQkrHBvr0ZFDUIp6AqwS6P",
  render_errors: [view: GenericFinderServerWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: GenericFinderServer.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# 이메일 인증을 위한 configuration
config :gmail, :oauth2,
  client_id: "clientID",
  client_secret: "client"

#이메일 인증에서 refresh token
config :gmail, :refresh_token, "1//04jUx1cc4d5YRCgYIARAAGAQSNwF-L9Ir0GwTTHKImt7hH8XOwN4X4zkUDgz4AHA-7-QGeKjH3Gz3ZTurKqS5jVZkPcN6wHJl9Xw"


# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

