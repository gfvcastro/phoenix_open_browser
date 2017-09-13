# PhoenixOpenBrowser

Opens a Phoenix application in system's default browser after boot server.

## Installation

Add `phoenix_open_browser` to your list of dependencies in `mix.exs`:

```elixir
{:phoenix_open_browser, "~> 0.1.1", only: :dev}
```

## Usage

Add in your `lib/example/application.ex`:

```elixir
defmodule Example.Application do
  use Application

  def start(_type, _arguments) do
    import Supervisor.Spec

    if Mix.env == :dev,
      do: PhoenixOpenBrowser.start(:example, ExampleWeb.Endpoint)

    # ...
  end
end
```

## License

See [LICENSE.md](/LICENSE.md).
