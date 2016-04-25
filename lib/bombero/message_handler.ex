defmodule Bombero.MessageHandler do
  alias Bombero.Messenger

  def handle(message = %{message: %{text: "help"}}) do
    sender = message.sender.id

    message.sender.id
    |> Messenger.send_text_message("Here's some help")
  end

  def handle(_), do: :nothing
end
