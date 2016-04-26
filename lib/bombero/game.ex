defmodule Bombero.Game do
  alias Bombero.{Database, GameState}

  @sets Application.get_env(:bombero, :sets)

  def start(id), do: __MODULE__.Supervisor.start_game(id)

  def start_link(id) do
    Agent.start_link(fn ->
      game_state = GameState.new(id)

      case Database.game_state(id) do
        nil -> game_state
        state -> %{ game_state | state: state }
      end
    end, name: {:global, {:game, id}})
  end


  def find(id) do
    case :global.whereis_name({:game, id}) do
      :undefined -> nil
      pid -> pid
    end
  end

  def stop(id) do
    id |> find() |> Agent.stop(:shutdown)
  end


  def state(game) do
    Agent.get(game, fn (game_state) ->
      game_state.state
    end)
  end

  def handle_payload(game, pl) when is_atom(pl) do
    Agent.update(game, fn (game_state) ->
      gs = GameState.choose(game_state, pl)
      Database.save_game_state(gs.data, gs.state)
      gs
    end)
  end

  def message(game) do
    Agent.get(game, fn (game_state) ->
      fetch_message(game_state.state)
    end)
  end

  def restart(game) do
    Agent.update(game, fn (game_state) ->
      gs = GameState.restart(game_state)
      Database.save_game_state(gs.data, gs.state)
      gs
    end)
  end


  defp fetch_message(state) do
    Map.get(@sets, state)
  end
end
