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
end
