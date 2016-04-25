defmodule Bombero.Router do
  require Logger

  use Plug.Router

  plug Plug.Logger
  plug :match
  plug :dispatch

  @fb_verify_token System.get_env("FB_VERIFY_TOKEN")
  @fb_page_access_token System.get_env("FB_PAGE_ACCESS_TOKEN")

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
    |> Enum.each(fn (event) ->
      MessageHandler.handle(event)
    end)

    # payload = Poison.Parser.parse!(body, keys: :atoms)
    # messaging_events = hd(payload.entry).messaging

    # Enum.each(messaging_events, fn (event) ->
    #   sender = event.sender.id
    #
    #   if Map.has_key?(event, :message) do
    #
    #     if event.message.text == "Generic" do
    #       Onlywatch.Messenger.send_generic_message(sender)
    #     else
    #       Onlywatch.Messenger.send_text_message(sender, String.slice(event.message.text, 0..200))
    #     end
    #
    #   else
    #     if Map.has_key?(event, :postback) do
    #       Onlywatch.Messenger.send_text_message(
    #         sender,
    #         "Postback received: #{String.slice(event.postback.payload, 0..200)}"
    #       )
    #     end
    #   end
    #
    # end)

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
