defmodule Bombero.MessageHandler do
  require Logger
  alias Bombero.Game

  @messenger Application.get_env(:bombero, :messenger)

  def handle(postback = %{postback: %{payload: "START_GAME"}}) do
    sender = postback.sender.id
    {:ok, game} = Game.start(sender)

    message = Game.message(game)
    state = Game.state(game)
    @messenger.send_button_message(sender, message.text, build_options(state, message.options))
  end

  def handle(postback = %{postback: %{payload: payload}}) do
    sender = postback.sender.id

    case Game.find(sender) do
      nil -> :ok
      game ->
        payload = payload |> String.downcase() |> String.to_atom()
        Game.handle_payload(game, payload)

        message = Game.message(game)
        state = Game.state(game)
        @messenger.send_button_message(sender, message.text, build_options(state, message.options))
    end
  end

  def handle(message) do
    Logger.info "Unhandled message:\n#{inspect message}"
    :nothing
  end


  defp build_options(state, options) do
    set = state |> Atom.to_string() |> String.upcase()

    options
    |> Enum.with_index()
    |> Enum.map(fn ({option, index}) ->
      %{
        type: "postback",
        title: option,
        payload: "#{set}_OPTION_#{index+1}"
      }
    end)
  end
end
