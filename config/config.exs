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
  url: [host: "152.70.89.118", port: 4321],
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
  config :generic_finder_server, GenericFinderServer.Mailer,
  adapter: Bamboo.SMTPAdapter,
  server: "smtp.gmail.com",
  hostname: "tngh147258@gmail.com",
  port: 587,
  username: "tngh147258@gmail.com", # or {:system, "SMTP_USERNAME"}
  password: "savealso97!", # or {:system, "SMTP_PASSWORD"}
  tls: :always, # can be `:always` or `:never` :if_available
  allowed_tls_versions: [:"tlsv1", :"tlsv1.1", :"tlsv1.2"], # or {:system, "ALLOWED_TLS_VERSIONS"} w/ comma seprated values (e.g. "tlsv1.1,tlsv1.2")
  # ssl: true, # can be `true` false
  retries: 1,
  no_mx_lookups: false, # can be `true`
  auth: :if_available # can be `:always`. If your smtp relay requires authentication set it to `:always`.

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

