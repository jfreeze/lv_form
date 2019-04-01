# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :lv_form,
  ecto_repos: [LvForm.Repo]

# Configures the endpoint
config :lv_form, LvFormWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "GgV2DSxMmysvlq62ohMNXRxDQ5X9H/egsP5tJS8fJHcBpw+dvTMlxDooBWiFYhcU",
  render_errors: [view: LvFormWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: LvForm.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [
    signing_salt: "PTPMRxHkxBSv0FQecYbBddhkmayZnkDR"
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
