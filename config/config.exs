# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :peepchat, Peepchat.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "4Gy/Goi4D5oY42KDvdRjdWdmb98Nt26UWflkFyk5lm9NzTE0gVBhjiabRXn4jJfg",
  render_errors: [accepts: ~w(json)],
  pubsub: [name: Peepchat.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :format_encoders,
  "json-api": Poison

config :plug, :mimes, %{
  "application/vnd.api+json" => ["json-api"]
}

config :guardian, Guardian,
  allowed_algos: ["HS512"],
  verify_module: Guardian.JWT,
  issuer: "Peepchat",
  ttl: { 30, :days },
  verify_issuer: true,
  secrect_key: System.get_env("GUARDIAN_SECRET") || "Q/PNBpCWO6RLHGwG2j2uCMkZhwGHQlvPcsorApip3wV+Et2IjFRLSqtDdrEFcQp0",
  serializer: Peepchat.GuardianSerializer

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# Configure phoenix generators
config :phoenix, :generators,
  migration: true,
  binary_id: false
