defmodule Bombero.GameTest do
  use ExUnit.Case

  alias Bombero.{Game, GameState}

  @id 123

  setup do
    {:ok, game} = Game.start(@id)

    on_exit fn ->
      Game.stop(@id)
    end

    {:ok, game: game}
  end

  test "finding the game", %{game: game} do
    assert Game.find(@id) == game
  end

  test "starting a new game", %{game: game} do
    assert Game.state(game) == :set_1
  end

  test "handling an incoming payload", %{game: game} do
    Game.handle_payload(game, :option_1)
    assert Game.state(game) == :set_2
  end

  test "the message to send", %{game: game} do
    message = Game.message(game)
    assert message.text == "Sample text"
    assert message.options == ["Option 1", "Option 2"]

    Game.handle_payload(game, :option_1)
    message = Game.message(game)
    assert message.text == "Sample text for set 2"
    assert message.options == ["Set 2: Option 1", "Set 2: Option 2", "Set 2: Option 3"]
  end
end
