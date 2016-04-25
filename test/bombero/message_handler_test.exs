defmodule Bombero.MessageHandlerTest do
  use BomberoCase

  alias Bombero.MessageHandler, as: Subject
  alias Bombero.{Game, TestMessenger}

  test "start game message" do
    Subject.handle(start_game_message)
    game = Bombero.Game.find(sender.id)
    assert game

    message = TestMessenger.generic_messages |> List.first()
    assert message.text == Game.message(game).text
    assert message.options == Game.message(game).options
  end


  defp start_game_message do
    postback_message("START_GAME")
  end

  defp postback_message(payload) do
    %{sender: sender,
      postback: %{
        payload: payload
      }
    }
  end

  defp sender do
    %{id: 123456}
  end
end
