defmodule Bombero.GameStateTest do
  use ExUnit.Case

  alias Bombero.GameState

  setup config do
    game_state = GameState.new

    if state = config[:state] do
      game_state = %{ game_state | state: state }
    end

    {:ok, %{subject: game_state}}
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

  @tag state: :set_25
  test "set_25", %{subject: subject} do
    subject = GameState.choose(subject, :set_25_option_1)
    assert subject.data.character_armor == "leather"
  end

  @tag state: :set_30
  test "set_30", %{subject: subject} do
    subject = GameState.choose(subject, :set_30_option_1)
    assert subject.data.plate_polished == false
    assert subject.data.armor_worn == false
    assert subject.data.box_opened == false
  end

  @tag state: :set_31
  test "set_31 state", %{subject: subject} do
    assert GameState.choose(subject, :set_31_option_2).state == :set_37

    subject = %{ subject | data: %{ subject.data | armor_worn: false } }
    assert GameState.choose(subject, :set_31_option_2).state == :set_34
  end

  @tag state: :set_31
  test "set_31 data", %{subject: subject} do
    subject = GameState.choose(subject, :set_31_option_1)
    assert subject.data.box_opened == true
  end

  @tag state: :set_32
  test "set_32 state", %{subject: subject} do
    data = subject.data

    assert GameState.choose(subject, :set_32_option_1).state == :set_36
    subject = %{ subject | data: %{ subject.data | plate_polished: false } }
    assert GameState.choose(subject, :set_32_option_1).state == :set_33
    subject = %{ subject | data: data }

    assert GameState.choose(subject, :set_32_option_2).state == :set_37
    subject = %{ subject | data: %{ subject.data | armor_worn: false } }
    assert GameState.choose(subject, :set_32_option_2).state == :set_34
  end

  @tag state: :set_33
  test "set_33 data", %{subject: subject} do
    subject = GameState.choose(subject, :set_33_option_1)
    assert subject.data.plate_polished == true
  end

  @tag state: :set_33
  test "set_33 state", %{subject: subject} do
    assert GameState.choose(subject, :set_33_option_1).state == :set_37
    subject = %{ subject | data: %{ subject.data | armor_worn: false } }
    assert GameState.choose(subject, :set_33_option_1).state == :set_34
  end

  @tag state: :set_34
  test "set_34 data", %{subject: subject} do
    subject = GameState.choose(subject, :set_34_option_1)
    assert subject.data.character_armor == "plate"
    assert subject.data.armor_worn == true
  end

  @tag state: :set_34
  test "set_34 state", %{subject: subject} do
    assert GameState.choose(subject, :set_34_option_1).state == :set_38
    subject = %{ subject | data: %{ subject.data | box_opened: true } }
    assert GameState.choose(subject, :set_34_option_1).state == :set_35
  end

  @tag state: :set_35
  test "set_35 data", %{subject: subject} do
    subject = GameState.choose(subject, :set_35_option_1)
    assert subject.data.character_armor == nil
  end

  @tag state: :set_35
  test "set_35 state", %{subject: subject} do
    assert GameState.choose(subject, :set_35_option_2).state == :set_37
    subject = %{ subject | data: %{ subject.data | armor_worn: false } }
    assert GameState.choose(subject, :set_35_option_2).state == :set_34
  end

  @tag state: :set_36
  test "set_36 state", %{subject: subject} do
    assert GameState.choose(subject, :set_36_option_1).state == :set_37
    subject = %{ subject | data: %{ subject.data | armor_worn: false } }
    assert GameState.choose(subject, :set_36_option_1).state == :set_34
  end

  @tag state: :set_37
  test "set_37", %{subject: subject} do
    subject = GameState.choose(subject, :set_37_option_1)
    assert subject.data.character_armor == "plate"
  end

  @tag state: :set_38
  test "set_38 data", %{subject: subject} do
    subject = GameState.choose(subject, :set_38_option_1)
    assert subject.data.character_armor == nil
  end

  @tag state: :set_38
  test "set_38 state", %{subject: subject} do
    assert GameState.choose(subject, :set_38_option_2).state == :set_37
    subject = %{ subject | data: %{ subject.data | armor_worn: false } }
    assert GameState.choose(subject, :set_38_option_2).state == :set_34
  end
end
