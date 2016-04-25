defmodule GameStateTest do
  use ExUnit.Case

  alias Bombero.GameState

  setup do
    {:ok, %{subject: GameState.new}}
  end

  test "initial state", %{subject: subject} do
    assert subject.state == :set_1
  end

  test "set_1 events", %{subject: subject} do
    option_1 = GameState.option_1(subject)
    assert option_1.state == :set_2

    option_2 = GameState.option_2(subject)
    assert option_2.state == :set_3
  end
end
