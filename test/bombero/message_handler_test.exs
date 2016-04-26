defmodule Bombero.MessageHandlerTest do
  use BomberoCase

  alias Bombero.MessageHandler, as: Subject
  alias Bombero.{Game, TestMessenger}

  test "initial message" do
    Subject.handle(text_message("Hello there"))

    message = hd(TestMessenger.generic_messages)
    assert message.title == "Welcome to Bombero Games"

    option = hd(message.options)
    assert option.title == "Player One Start"
    assert option.payload == "START_GAME"
  end

  test "sending more messages" do
    Subject.handle(text_message("Hello there"))

    TestMessenger.reset()

    Subject.handle(text_message("More"))

    assert Enum.count(TestMessenger.generic_messages) == 0
  end

  test "start game postback" do
    Subject.handle(start_game_message)
    game = Bombero.Game.find(sender.id)
    assert game

    assert sent_message.text == "Sample text"

    options = sent_message.options
    assert Enum.map(options, &(Map.get(&1, :payload))) == ["SET_1_OPTION_1", "SET_1_OPTION_2"]
    assert Enum.map(options, &(Map.get(&1, :title))) == ["Option 1", "Option 2"]
  end

  test "option postbacks" do
    game = start_game(sender.id)

    Subject.handle(option_1_message)
    assert Game.state(game) == :set_2

    assert sent_message.text == "Sample text for set 2"

    options = sent_message.options
    assert Enum.map(options, &(Map.get(&1, :payload))) == ["SET_2_OPTION_1", "SET_2_OPTION_2", "SET_2_OPTION_3"]
    assert Enum.map(options, &(Map.get(&1, :title))) == ["Set 2: Option 1", "Set 2: Option 2", "Set 2: Option 3"]
  end

  test "long messages" do
    start_game(sender.id)
    Subject.handle(option_1_message)
    TestMessenger.reset()

    Subject.handle(option_2_message)

    assert Enum.count(TestMessenger.text_messages) == 1
    assert Enum.count(TestMessenger.button_messages) == 1

    text_message = hd(TestMessenger.text_messages)
    button_message = sent_message

    assert text_message.text == "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam ipsum diam, eleifend a nibh sit amet, tristique mollis dui. Aliquam erat volutpat. Cras massa felis,"
    assert button_message.text == "porta ut metus nec, varius ullamcorper leo. Integer id vulputate ante. Cras vitae nisi fringilla, faucibus nulla eu, volutpat massa. Fusce euismod volutpat."
  end


  defp option_1_message do
    postback_message("SET_1_OPTION_1")
  end

  defp option_2_message do
    postback_message("SET_2_OPTION_1")
  end

  defp sent_message do
    TestMessenger.button_messages |> List.first()
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

  defp start_game(id) do
    {:ok, game} = Game.start(id)
    Game.handle_payload(game, :start_game)
    game
  end

  defp text_message(text) do
    %{sender: sender,
      message: %{
        text: text
      }
    }
  end

  defp sender do
    %{id: 123456}
  end
end
