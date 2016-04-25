defmodule Bombero.MessageHandler do
  require Logger
  alias Bombero.Game

  @messenger Application.get_env(:bombero, :messenger)
  @max_character_limit 320

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

        send_button_message(sender, message.text, build_options(state, message.options))
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

  defp send_button_message(sender, text, options) when byte_size(text) > @max_character_limit do
    split_near = round(byte_size(text) / 2)
    {first, second} = build_text('', String.to_char_list(text), split_near)

    @messenger.send_text_message(sender, first)
    send_button_message(sender, second, options)
  end
  defp send_button_message(sender, text, options) do
    @messenger.send_button_message(sender, text, options)
  end

  defp build_text(result, text, limit) when length(result) > limit and hd(text) == ?\s do
    first =
      result
      |> Enum.reverse()
      |> List.to_string()

    second =
      text
      |> List.to_string()
      |> String.strip()

    {first, second}
  end
  defp build_text(result, [c | rest], limit) do
    build_text([ c | result ], rest, limit)
  end
end
