defmodule Bombero do
  use Application
  import Supervisor.Spec, warn: false

  @server Application.get_env(:bombero, :server)

  def start(_type, _args) do
    children = [
      supervisor(Bombero.Game.Supervisor, []),
      worker(Bombero.Database, [])
    ] ++ server_child(@server)

    opts = [strategy: :one_for_one, name: Bombero.Supervisor]
    Supervisor.start_link(children, opts)
  end

  defp server_child(false), do: []
  defp server_child(_), do: [worker(Bombero.Server, [])]
end
