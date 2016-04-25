defmodule Bombero.Mixfile do
  use Mix.Project

  def project do
    [app: :bombero,
     version: "0.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def application do
    [applications: [:logger],
     mod: {Bombero, []}]
  end

  defp deps do
    [{:fsm, "~> 0.2.0"}]
  end
end
