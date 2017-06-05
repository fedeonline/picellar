# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :picellar,
  ecto_repos: [Picellar.Repo]

# Configures the endpoint
config :picellar, Picellar.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "A0SwRX476u7unwTmRTJ2q/J0qcePquEhV523adfUmwgxxMfiP8gDx+CkgOUa1mCk",
  render_errors: [view: Picellar.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Picellar.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
