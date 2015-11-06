defmodule Mongo.Mixfile do
  use Mix.Project

  def project do
    [ app: :mongo,
      name: "mongo",
      version: "0.5.2",
      elixir: "~> 1.1.0",
      source_url: "https://github.com/checkiz/elixir-mongo",
      description: "MongoDB driver for Elixir",
      deps: deps(Mix.env),
      package: package,
      docs: &docs/0 ]
  end

  # Configuration for the OTP application
  def application do
    [
      applications: [],
      env: [host: {"127.0.0.1", 27017}]
    ]
  end

  # Returns the list of dependencies for prod
  defp deps(:prod) do
    [
      {:cbson, github: "sean-lin/elixir-cbson"},
    ]
  end

  # Returns the list of dependencies for docs
  defp deps(:docs) do
    deps(:prod) ++
      [
        {:ex_doc, ">= 0.0.0" },
        {:earmark, ">= 0.0.0"}
      ]
  end
  defp deps(_), do: deps(:prod)

  defp docs do
    [ #readme: false,
      #main: "README",
      source_ref: System.cmd("git", ["rev-parse", "--verify", "--quiet", "HEAD"])|>elem(0) ]
  end

  defp package do
    [ contributors: ["jerp"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/checkiz/elixir-mongo",
        "Documentation" => "https://checkiz.github.io/elixir-mongo"
      } ]
  end

end
