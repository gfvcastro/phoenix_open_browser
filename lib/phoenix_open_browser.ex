defmodule PhoenixOpenBrowser do
  def start(application, endpoint) do
    Application.get_env(application, endpoint)
    |> build_uri()
    |> open_browser()
  end

  defp build_uri(configuration) do
    %URI{
      host: configuration[:url][:host],
      path: configuration[:url][:path],
      port: configuration[:url][:port] || configuration[:http][:port],
      scheme: configuration[:url][:scheme] || "http"
    }
    |> URI.to_string()
  end

  defp open_browser(uri) do
    start_executable = start_executable()

    if System.find_executable(start_executable),
      do: System.cmd(start_executable, [uri])
  end

  defp start_executable do
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
