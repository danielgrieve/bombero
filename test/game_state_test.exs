defmodule GameStateTest do
  use ExUnit.Case

  alias Bombero.GameState

  setup do
    {:ok, %{subject: GameState.new}}
  end

  test "initial state", %{subject: subject} do
    assert subject.state == :waiting_to_start
  end

  test "starting game", %{subject: subject} do
    subject = GameState.choose(subject, :start_game)
    assert subject.state == :set_1
  end

  test "set_1 events", %{subject: subject} do
    subject = GameState.choose(subject, :start_game)

    option_1 = GameState.choose(subject, :set_1_option_1)
    assert option_1.state == :set_2

    option_2 = GameState.choose(subject, :set_1_option_2)
    assert option_2.state == :set_3
  end

  test "sending an incorrect option", %{subject: subject} do
    before_state = subject.state
    assert GameState.choose(subject, :invalid).state == before_state
  end
end
