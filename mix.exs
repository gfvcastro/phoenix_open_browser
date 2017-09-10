defmodule PhoenixOpenBrowser.Mixfile do
  use Mix.Project

  def project do
    [
      app: :phoenix_open_browser,
      version: "0.1.1",
      elixir: "~> 1.3",
      deps: deps(),
      package: package(),
      name: "PhoenixOpenBrowser",
      description: "Opens Phoenix application in system's default browser after boot server"
    ]
  end

  def application do
    [
      applications: [:logger]
    ]
  end

  defp deps do
    []
  end

  defp package do
    [
      licenses: ["MIT"],
      maintainers: ["Gustavo Villa"],
      links: %{"GitHub" => "https://github.com/gfvcastro/phoenix_open_browser"}
    ]
  end
end
