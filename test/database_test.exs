defmodule Bombero.DatabaseTest do
  use BomberoCase

  alias Bombero.{Database, GameState}

  @player_id 123

  test "persisting and retrieving the game" do
    state = GameState.new(@player_id)
    Database.save_game(state)
    assert Database.game(@player_id) == state
  end

  test "game doesn't exist" do
    refute Database.game(999)
  end

  test "updates the game if it exists" do
    state = %{ GameState.new(@player_id) | state: :another_state }
    Database.save_game(state)
    assert Database.game(@player_id).state == :another_state
  end

  test "parsing a database URL" do
    example = "mongodb://username:password@host-name.example.com:12345/database_name"

    assert Database.parse_url(example) == [
      username: "username",
      password: "password",
      hostname: "host-name.example.com",
      port: 12345,
      database: "database_name"
    ]
  end
end
