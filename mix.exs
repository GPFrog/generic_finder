defmodule GenericFinderServer.MixProject do
  use Mix.Project

  def project do
    [
      app: :generic_finder_server,
      version: "0.1.0",
      elixir: "~> 1.7",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {GenericFinderServer.Application, []},
      extra_applications: [:logger, :runtime_tools,
      :bamboo, :bamboo_smtp
      ]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      #node js용 설치(대기)
      {:nodejs, "~> 2.0"},
      {:phoenix, "~> 1.5.7"},
      {:phoenix_ecto, "~> 4.1"},
      {:ecto_sql, "~> 3.4"},
      {:myxql, ">= 0.0.0"},
      {:phoenix_html, "~> 2.11"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:phoenix_live_dashboard, "~> 0.4"},
      {:telemetry_metrics, "~> 0.4"},
      {:telemetry_poller, "~> 0.4"},
      {:gettext, "~> 0.11"},
      #json처리용
      {:json, "~> 1.4"},
      {:jason, "~> 1.2"},
      {:poison, "~> 3.1", override: true},
      {:plug_cowboy, "~> 2.0"},
      {:crawly, "~> 0.13.0"},
      {:floki, "~> 0.26.0"},
      #xml처리기
      {:elixir_xml_to_map, "~> 2.0"},
      #이메일 인증용
      {:bamboo, "~> 0.7.0", override: true},
      {:bamboo_smtp, "~> 1.2.1"},
      {:httpoison, "~> 1.8", override: true},
      #이 밑으로 확인필요
      # {:phoenix_pubsub, "~> 1.0", override: true},
      # {:postgrex, ">= 0.0.0"},
      # {:cowboy, "~> 1.0", override: true}
      {:poolboy, "~> 1.5.1"}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to install project dependencies and perform other setup tasks, run:
  #
  #     $ mix setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      setup: ["deps.get", "ecto.setup", "cmd npm install --prefix assets"],
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      test: ["ecto.create --quiet", "ecto.migrate --quiet", "test"]
    ]
  end
end
