defmodule BomberoCase do
  use ExUnit.CaseTemplate

  setup do
    on_exit fn ->
      Bombero.TestMessenger.reset
      Bombero.Game.stop(123456)
    end
  end
end
