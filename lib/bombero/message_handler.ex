defmodule Bombero.MessageHandler do
  require Logger
  alias Bombero.Game

  @messenger Application.get_env(:bombero, :messenger)

  def handle(postback = %{postback: %{payload: "START_GAME"}}) do
    sender = postback.sender.id
    {:ok, game} = Game.start(sender)
    @messenger.send_text_message(sender, Game.message(game).text)
  end

  def handle(message) do
    Logger.info "Unhandled message:\n#{inspect message}"
    :nothing
  end
end
