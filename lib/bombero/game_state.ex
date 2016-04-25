defmodule Bombero.GameState do
  use Fsm, initial_state: :set_1

  defstate set_1 do
    defevent option_1, do: next_state(:set_2)
    defevent option_2, do: next_state(:set_3)
  end
end
