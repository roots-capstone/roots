# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :roots,
  ecto_repos: [Roots.Repo]

# Configures the endpoint
config :roots, RootsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "iqeVUC1bB6WRINZbrqOKfjd2Kc3PvsJ9/Fy/ink4YUat08EYZhE1kJ2j8IvxKPHQ",
  render_errors: [view: RootsWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Roots.PubSub,
  live_view: [signing_salt: "FNLYJkTG"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
