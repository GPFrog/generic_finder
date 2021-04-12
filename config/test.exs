use Mix.Config

# Configure your database
config :generic_finder_server, GenericFinderServer.Repo,
  username: "root",
  password: "",
  database: "generic_finder_server_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :generic_finder_server, GenericFinderServerWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
