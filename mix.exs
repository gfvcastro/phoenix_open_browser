defmodule PhoenixOpenBrowser.Mixfile do
  use Mix.Project

  def project do
    [
      app: :phoenix_open_browser,
      version: "0.1.3",
      elixir: "~> 1.7",
      deps: deps(),
      package: package(),
      name: "PhoenixOpenBrowser",
      description:
        "A module that opens a Phoenix application in the system default browser after boot server"
    ]
  end

  def application do
    []
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
