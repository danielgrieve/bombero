use Mix.Config

config :bombero, Bombero.Database,
  database_url: System.get_env("MONGODB_URI")
