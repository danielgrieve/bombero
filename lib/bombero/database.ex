defmodule Bombero.Database do
  use GenServer

  alias Bombero.Database.Pool

  @database Application.get_env(:bombero, __MODULE__)[:database]
  @database_url Application.get_env(:bombero, __MODULE__)[:database_url]
  @collection "player-game-states"

  def start_link do
    if @database_url do
      Pool.start_link(parse_url(@database_url))
    else
      Pool.start_link(database: @database)
    end
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

  def parse_url(url) do
    %{userinfo: userinfo, host: host, port: port, path: path}  = URI.parse(url)
    [username, password] = String.split(userinfo, ":")
    database = String.replace(path, "/", "")
    [username: username, password: password, host: host, port: port, database: database]
  end
end
