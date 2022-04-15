defmodule PhoenixOpenBrowser do
  @moduledoc false

  @doc """
  Opens a Phoenix application in the system default browser.

      * `application` - the OTP application that runs the endpoint
      * `endpoint` - the endpoint module

  ## Examples

      iex> PhoenixOpenBrowser.start(:example, ExampleWeb.Endpoint)
      {"", 0}

  """
  def start(application, endpoint) do
    Application.get_env(application, endpoint)
    |> build_application_uri()
    |> start_browser_session()
  end

  defp build_application_uri(configuration) do
    %URI{
      host: configuration[:url][:host],
      path: configuration[:url][:path],
      port: configuration[:url][:port],
      scheme: configuration[:url][:scheme]
    }
    |> URI.to_string()
  end

  defp start_browser_session(uri) do
    start_command = start_command()

    if System.find_executable(start_command),
      do: System.cmd(start_command, [uri])
  end

  defp start_command do
    case :os.type() do
      {:win32, _} ->
        "start"

      {:unix, :darwin} ->
        "open"

      {:unix, _} ->
        "xdg-open"
    end
  end
end
