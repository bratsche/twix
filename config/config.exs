import Config

Code.require_file("default_config.exs", "config")

config :twix, Twix.DefaultConfig.get()
