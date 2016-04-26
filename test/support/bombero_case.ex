defmodule BomberoCase do
  use ExUnit.CaseTemplate

  setup do
    on_exit fn ->
      Bombero.TestMessenger.reset

      # TODO Replace hard-coded ID with something more robust
      if Bombero.Game.find(123456) do
        Bombero.Game.stop(123456)
      end
    end
  end
end
