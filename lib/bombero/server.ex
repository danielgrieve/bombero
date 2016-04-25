defmodule Bombero.Server do
  def start_link do
    Plug.Adapters.Cowboy.http Bombero.Router, [], port: port(System.get_env("PORT"))
  end

  defp port(nil), do: 4000
  defp port(value), do: String.to_integer(value)
end
