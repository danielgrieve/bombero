defmodule Bombero.Router do
  require Logger

  alias Bombero.MessageHandler

  use Plug.Router

  plug Plug.Logger
  plug :match
  plug :dispatch

  @fb_verify_token System.get_env("FB_VERIFY_TOKEN")

  get "/webhook" do
    conn
    |> Plug.Conn.fetch_query_params()
    |> verify_token()
  end

  post "/webhook" do
    {:ok, body, conn} = Plug.Conn.read_body(conn)


    body
    |> Poison.Parser.parse!(keys: :atoms)
    |> Map.get(:entry)
    |> hd()
    |> Map.get(:messaging)
    |> Enum.each(&MessageHandler.handle/1)

    send_resp(conn, 200, "Message received")
  end

  match _ do
    send_resp(conn, 404, "404 - Page not found")
  end

  defp verify_token(conn = %{params: %{
      "hub.verify_token" => @fb_verify_token,
      "hub.challenge" => challenge
    }}) do
    send_resp(conn, 200, challenge)
  end

  defp verify_token(conn) do
    send_resp(conn, 401, "Error, wrong validation token")
  end
end
