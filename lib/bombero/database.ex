defmodule Bombero.Database do
  use GenServer

  alias Bombero.Database.Pool

  @database Application.get_env(:bombero, __MODULE__)[:database]
  @collection "player-game-states"

  def start_link do
    Pool.start_link(database: @database)
  end

  def stop do
    GenServer.whereis(Pool.Sup) |> GenServer.stop(:shutdown)
  end


  def save_game_state(player_id, state) do
    Mongo.replace_one(
      Pool,
      @collection,
      %{"player_id" => player_id},
      %{"player_id" => player_id, "state" => state},
      [{:upsert, true}]
    )
  end

  def game_state(player_id) do
    player =
      Mongo.find(Pool, @collection, %{"player_id" => player_id})
      |> Enum.to_list()
      |> List.first()

    case player do
      nil -> nil
      player ->
        player
        |> Map.get("state")
        |> String.to_atom()
    end
  end
end
