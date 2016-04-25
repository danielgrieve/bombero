defmodule Bombero.Router do
  require Logger

  use Plug.Router

  plug Plug.Logger
  plug :match
  plug :dispatch

  @validation_token System.get_env("FB_SECRET_TOKEN")
  @page_access_token System.get_env("FB_PAGE_ACCESS_TOKEN")

  get "/webhook" do
    conn
    |> Plug.Conn.fetch_query_params()
    |> verify_token()
  end

  post "/webhook" do
    send_resp(conn, 200, "Message received")
  end

  match _ do
    send_resp(conn, 404, "404 - Page not found")
  end

  defp verify_token(conn = %{params: %{
      "hub.verify_token" => @validation_token,
      "hub.challenge" => challenge
    }}) do
    send_resp(conn, 200, challenge)
  end

  defp verify_token(conn) do
    send_resp(conn, 401, "Error, wrong validation token")
  end
end
