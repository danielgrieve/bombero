defmodule Bombero.Game.Supervisor do
  use Supervisor

  def start_game(id) do
    Supervisor.start_child(__MODULE__, [id])
  end

  def start_link do
    Supervisor.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def init(:ok) do
    children = [
      worker(Bombero.Game, [], restart: :transient)
    ]

    supervise(children, strategy: :simple_one_for_one)
  end
end
