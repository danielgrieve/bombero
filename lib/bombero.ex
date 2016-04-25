defmodule Bombero do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      supervisor(Bombero.Game.Supervisor, [])
    ]

    opts = [strategy: :one_for_one, name: Bombero.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
