defmodule Bombero.MessageHandler do
  require Logger
  alias Bombero.Game

  @messenger Application.get_env(:bombero, :messenger)

  def handle(postback = %{postback: %{payload: "START_GAME"}}) do
    sender = postback.sender.id
    {:ok, game} = Game.start(sender)

    message = Game.message(game)
    @messenger.send_button_message(sender, message.text, message.options)
  end

  def handle(postback = %{postback: %{payload: payload}}) do
    sender = postback.sender.id

    case Game.find(sender) do
      nil -> :ok
      game ->
        payload = payload |> String.downcase() |> String.to_atom()
        Game.handle_payload(game, payload)

        message = Game.message(game)
        @messenger.send_button_message(sender, message.text, message.options)
    end
  end

  def handle(message) do
    Logger.info "Unhandled message:\n#{inspect message}"
    :nothing
  end
end
