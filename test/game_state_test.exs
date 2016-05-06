defmodule Bombero.GameStateTest do
  use ExUnit.Case

  alias Bombero.GameState

  setup do
    {:ok, %{subject: GameState.new}}
  end

  test "initial state", %{subject: subject} do
    assert subject.state == :waiting_to_start
  end

  test "new with id" do
    data = GameState.new(123).data
    assert data.id == 123
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

  test "set_25", %{subject: subject} do
    subject =
      subject
      |> Map.put(:state, :set_25)
      |> GameState.choose(:set_25_option_1)

    assert subject.data.character_armor == "leather"
  end

  test "set_30", %{subject: subject} do
    subject =
      subject
      |> Map.put(:state, :set_30)
      |> GameState.choose(:set_30_option_1)

    assert subject.data.plate_polished == false
    assert subject.data.armor_worn == false
    assert subject.data.box_opened == false
  end

  test "set_31", %{subject: subject} do
    subject =
      subject
      |> Map.put(:state, :set_31)
      |> GameState.choose(:set_31_option_1)

    assert subject.data.box_opened == true
  end

  test "set_33", %{subject: subject} do
    subject =
      subject
      |> Map.put(:state, :set_33)
      |> GameState.choose(:set_33_option_1)

    assert subject.data.plate_polished == true
  end

  test "set_34", %{subject: subject} do
    subject =
      subject
      |> Map.put(:state, :set_34)
      |> GameState.choose(:set_34_option_1)

    assert subject.data.character_armor == "plate"
    assert subject.data.armor_worn == true
  end

  test "set_35", %{subject: subject} do
    subject =
      subject
      |> Map.put(:state, :set_35)
      |> GameState.choose(:set_35_option_1)

    assert subject.data.character_armor == nil
  end
end
