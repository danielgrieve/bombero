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
    [applications: [:logger, :cowboy, :plug, :httpoison],
     mod: {Bombero, []}]
  end

  defp deps do
    [{:fsm, "~> 0.2.0"},
     {:cowboy, "~> 1.0"},
     {:plug, "~> 1.0"},
     {:httpoison, "~> 0.8.0"},
     {:poison, "~> 2.0"}]
  end
end