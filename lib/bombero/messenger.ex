defmodule Bombero.Messenger do
  @page_access_token System.get_env("FB_PAGE_ACCESS_TOKEN")
  @headers [{"Content-Type", "application/json"}]

  def send_text_message(recipient, text) do
    payload = %{
      recipient: %{id: recipient},

      message: %{
        text: text
      }
    }

    HTTPoison.post!(url, Poison.encode!(payload), @headers)
  end


  defp url do
    "https://graph.facebook.com/v2.6/me/messages?access_token=#{@page_access_token}"
  end
end
