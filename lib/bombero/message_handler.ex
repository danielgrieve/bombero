defmodule Bombero.MessageHandler do
  require Logger

  @messenger Application.get_env(:bombero, :messenger)

  def handle(message = %{message: %{text: "help"}}) do
    sender = message.sender.id

    message.sender.id
    |> @messenger.send_text_message("Here's some help")
  end

  def handle(message) do
    Logger.info "Unhandled message:\n#{inspect message}"
    :nothing
  end
end
