# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :docsIntro,
  ecto_repos: [DocsIntro.Repo]

# Configures the endpoint
config :docsIntro, DocsIntroWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "QMgEZOf3K2Vt8kaU2gu2mGMSUydADpuu5PmpVM6VhKozPj6ZV+IzGu6llckRbf3b",
  render_errors: [view: DocsIntroWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: DocsIntro.PubSub,
  live_view: [signing_salt: "yH+YXLDG"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
