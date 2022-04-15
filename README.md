# PhoenixOpenBrowser

A module that opens a Phoenix application in the system default browser after boot server.

## Installation

Add `phoenix_open_browser` to your list of dependencies in your `mix.exs`:

```elixir
{:phoenix_open_browser, "~> 0.1.2", only: :dev}
```

And then execute:

```bash
mix deps.get
```

## Usage

Phoenix 1.6.0 includes [support for watcher as a MFA](https://github.com/phoenixframework/phoenix/commit/d1cc7c0fd06c0a2484197a49c36cc27085c0c2e6), you can take advantage of it.

Add `phoenix_open_browser` to your `:watchers` option in your `config/dev.exs`:

```elixir
config :example, ExampleWeb.Endpoint,
  watchers: [
    phoenix_open_browser: {PhoenixOpenBrowser, :start, [:example, ExampleWeb.Endpoint]}
  ]
```

As another option, you can add this line to your `Application.start/2` function in your `lib/example/application.ex`:

```elixir
defmodule Example.Application do
  use Application

  def start(_type, _arguments) do
    if Mix.env == :dev,
      do: PhoenixOpenBrowser.start(:example, ExampleWeb.Endpoint)
  end
end
```

## License

The package is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
