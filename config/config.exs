import Config

Code.eval_file("default_config.exs", "config")

config :twix, Twix.DefaultConfig.get()
