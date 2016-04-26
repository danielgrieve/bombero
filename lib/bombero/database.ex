defmodule Bombero.Database do
  use GenServer

  alias Bombero.Database.Pool

  @database Application.get_env(:bombero, __MODULE__)[:database]

  def start_link do
    Pool.start_link(database: @database)
  end

  def stop do
    GenServer.whereis(Pool.Sup) |> GenServer.stop(:shutdown)
  end


  def save_game_state(player_id, state) do
    Mongo.insert_one(
      Pool,
      "player_game_states",
      %{"player_id" => player_id, "state" => state}
    )
  end

  def game_state(player_id) do
    Mongo.find(Pool, "player_game_states", %{"player_id" => player_id})
    |> Enum.to_list()
    |> List.first()
    |> Map.get("state")
    |> String.to_atom()
  end
end
