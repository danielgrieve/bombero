defmodule Bombero.GameTest do
  use BomberoCase

  alias Bombero.{Database, Game}

  @id 123

  setup do
    {:ok, game} = Game.start(@id)
    Game.handle_payload(game, :start_game)

    on_exit fn ->
      Game.stop(@id)
    end

    {:ok, game: game}
  end

  test "finding the game", %{game: game} do
    assert Game.find(@id) == game
  end

  test "finding a game with existing state" do
    Database.save_game_state(789, :set3)
    game = Game.find(789)
    assert Game.state(game) == :set3
  end

  test "starting a new game" do
    {:ok, game} = Game.start(456)
    assert Game.state(game) == :waiting_to_start
    Game.stop(456)
  end

  test "starting a game with a player state in the database" do
    Database.save_game_state(789, :set_3)

    {:ok, game} = Game.start(789)
    assert Game.state(game) == :set_3
    Game.stop(789)
  end

  test "handling an incoming payload", %{game: game} do
    Game.handle_payload(game, :set_1_option_1)
    assert Game.state(game) == :set_2
    assert Database.game_state(@id) == :set_2
  end

  test "the message to send", %{game: game} do
    message = Game.message(game)
    assert message.text == "Sample text"
    assert message.options == ["Option 1", "Option 2"]

    Game.handle_payload(game, :set_1_option_1)
    message = Game.message(game)
    assert message.text == "Sample text for set 2"
    assert message.options == ["Set 2: Option 1", "Set 2: Option 2", "Set 2: Option 3"]
  end

  test "restarting game", %{game: game} do
    Game.handle_payload(game, :set_1_option_1)
    Game.restart(game)
    assert Game.state(game) == :set_1
    assert Database.game_state(@id) == :set_1
  end
end
