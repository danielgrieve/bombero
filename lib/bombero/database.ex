defmodule Bombero.Database do
  use GenServer

  alias Bombero.Database.Pool

  @database Application.get_env(:bombero, __MODULE__)[:database]
  @database_url Application.get_env(:bombero, __MODULE__)[:database_url]
  @collection "games"

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


  def game(player_id) do
    game =
      Mongo.find(Pool, @collection, %{"data.id" => player_id})
      |> Enum.to_list()
      |> List.first()
      |> string_keys_to_atom_keys()

    case game do
      nil -> nil
      game ->
        game =
          game
          |> Map.delete(:_id)
          |> Map.update(:state, :ok, &String.to_atom/1)

        data = string_keys_to_atom_keys(game.data)
        game = %{ game | data: struct(Bombero.GameStateData, data) }
        struct(Bombero.GameState, game)
    end
  end

  def save_game(game_state) do
    Mongo.replace_one(
      Pool,
      @collection,
      %{"data.id" => game_state.data.id},
      game_state,
      [{:upsert, true}]
    )
  end

  def parse_url(url) do
    %{userinfo: userinfo, host: host, port: port, path: path}  = URI.parse(url)
    [username, password] = String.split(userinfo, ":")
    database = String.replace(path, "/", "")
    [username: username, password: password, hostname: host, port: port, database: database]
  end


  defp string_keys_to_atom_keys(map) when is_map(map) do
    for {key, val} <- map, into: %{} do
      cond do
        is_binary(key) -> {String.to_atom(key), val}
        true -> {key, val}
      end
    end
  end
  defp string_keys_to_atom_keys(map), do: map
end
