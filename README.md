# PhoenixOpenBrowser

Opens Phoenix application in system's default browser after boot server.

## Installation

Add `phoenix_open_browser` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:phoenix_open_browser, "~> 0.1.1", only: :dev}
  ]
end
```

## Usage

Add in your `lib/my_app/application.ex`:

```elixir
defmodule MyApp.Application do
  use Application

  def start(_type, _arguments) do
    import Supervisor.Spec

    if Mix.env == :dev,
      do: PhoenixOpenBrowser.start(:my_app, MyAppWeb.Endpoint)

    # ...
  end
end
```

## License

See [LICENSE.md](/LICENSE.md).
