import Config

config :my_app, MyApp.Repo,
  url: "ecto://user:password@localhost:5432/app_dev"

config :external_service,
  api_key: "123123"