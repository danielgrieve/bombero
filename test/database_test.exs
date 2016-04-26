defmodule Bombero.DatabaseTest do
  use BomberoCase

  alias Bombero.Database

  test "persisting and retrieving game state" do
    player_id = 123

    Database.save_game_state(player_id, :set_1)
    assert Database.game_state(player_id) == :set_1

    Database.stop
    :timer.sleep(100) # Hopefully the database has restarted by now

    assert Database.game_state(player_id) == :set_1
  end

  test "game state doesn't exist" do
    refute Database.game_state(999)
  end

  test "updates the game state if it exists" do
    player_id = 123

    Database.save_game_state(player_id, :set_1)
    Database.save_game_state(player_id, :set_2)

    assert Database.game_state(player_id) == :set_2
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
