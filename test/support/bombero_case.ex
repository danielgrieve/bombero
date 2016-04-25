defmodule BomberoCase do
  use ExUnit.CaseTemplate

  setup do
    on_exit fn ->
      Bombero.TestMessenger.reset
    end
  end
end
