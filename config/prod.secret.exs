use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
config :peepchat, Peepchat.Endpoint,
  secret_key_base: "BVS1zGlGBA+ZXyh3DKqgj9tLcfoEaUjyH4E6iue14wH+BXt8uYoyXRtXLPKx421l"

# Configure your database
config :peepchat, Peepchat.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "peepchat_prod",
  pool_size: 20
