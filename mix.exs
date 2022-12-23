defmodule Twix.MixProject do
  use Mix.Project

  @version "0.2.0"
  @description "Tailwind class merging in Elixir"

  def project() do
    [
      app: :twix,
      version: @version,
      description: @description,
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      docs: docs(),
      package: package(),
      source_url: "https://github.com/bratsche/twix"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application() do
    []
  end

  defp deps() do
    [
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end

  defp docs() do
    [
      main: "Twix",
      source_ref: "v#{@version}",
      source_url: "https://github.com/bratsche/twix",
      extras: ["CHANGELOG.md"],
      skip_undefined_reference_warnings_on: ["CHANGELOG.md"]
    ]
  end

  defp package() do
    [
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/bratsche/twix"
      }
    ]
  end
end
