defmodule Bombero.Mixfile do
  use Mix.Project

  def project do
    [app: :bombero,
     version: "0.0.1",
     elixir: "~> 1.2",
     elixirc_paths: elixirc_paths(Mix.env),
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def application do
    [applications: [:logger, :cowboy, :plug, :httpoison, :mongodb, :poolboy],
     mod: {Bombero, []}]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]

  defp deps do
    [{:fsm, "~> 0.2.0"},
     {:cowboy, "~> 1.0"},
     {:plug, "~> 1.0"},
     {:httpoison, "~> 0.8.0"},
     {:poison, "~> 2.0"},
     {:mongodb, "~> 0.1"},
     {:poolboy, "~> 1.5"},

     {:ex_guard, "~> 1.1.0", only: :dev}]
  end
end
