defmodule Bombero.MessageHandler do
  require Logger

  alias Bombero.Messenger

  def handle(message = %{message: %{text: "help"}}) do
    sender = message.sender.id

    message.sender.id
    |> Messenger.send_text_message("Here's some help")
  end

  def handle(message) do
    Logger.info "Unhandled message:\n#{inspect message}"
    :nothing
  end
end
