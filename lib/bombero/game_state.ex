defmodule Bombero.GameState do
  use Fsm, initial_state: :waiting_to_start

  defstate waiting_to_start do
    defevent choose(:start_game), do: next_state(:set_1)
  end

  defstate set_1 do
    defevent choose(:set_1_option_1), do: next_state(:set_2)
    defevent choose(:set_1_option_2), do: next_state(:set_3)
  end

  defstate set_2 do
    defevent choose(:set_2_option_1), do: next_state(:set_5)
    defevent choose(:set_2_option_2), do: next_state(:set_4)
  end

  defstate set_3 do
    defevent choose(:set_3_option_1), do: next_state(:set_6)
  end

  defstate set_4 do
    defevent choose(:set_4_option_1), do: next_state(:set_6)
  end

  defstate set_5 do
    defevent choose(:set_5_option_1), do: next_state(:set_6)
  end

  defstate set_6 do
    defevent choose(:set_6_option_1), do: next_state(:set_7)
    defevent choose(:set_6_option_2), do: next_state(:set_8)
    defevent choose(:set_6_option_3), do: next_state(:set_11)
  end

  defstate set_7 do
    defevent choose(:set_7_option_1), do: next_state(:set_8)
    defevent choose(:set_7_option_2), do: next_state(:set_11)
  end

  defstate set_8 do
    defevent choose(:set_8_option_1), do: next_state(:set_12)
    defevent choose(:set_8_option_2), do: next_state(:set_9)
    defevent choose(:set_8_option_3), do: next_state(:set_13)
  end

  defstate set_9 do
    defevent choose(:set_9_option_1), do: next_state(:set_10)
  end

  defstate set_10 do
    defevent choose(:set_10_option_1), do: next_state(:set_12)
    defevent choose(:set_10_option_2), do: next_state(:set_13)
  end

  defstate set_11 do
    defevent choose(:set_11_option_1), do: next_state(:set_8)
  end

  defstate set_12 do
    defevent choose(:set_12_option_1), do: next_state(:set_14)
    defevent choose(:set_12_option_2), do: next_state(:set_14)
    defevent choose(:set_12_option_3), do: next_state(:set_13)
  end

  defstate set_13 do
    defevent choose(:set_13_option_1), do: next_state(:set_15)
  end

  defstate set_14 do
    defevent choose(:set_14_option_1), do: next_state(:set_16)
  end

  defstate set_15 do
    defevent choose(:set_15_option_1), do: next_state(:set_16)
  end

  defstate set_16 do
    defevent choose(:set_16_option_1), do: next_state(:set_17)
    defevent choose(:set_16_option_2), do: next_state(:set_17)
    defevent choose(:set_16_option_3), do: next_state(:set_19)
  end

  defstate set_17 do
    defevent choose(:set_17_option_1), do: next_state(:set_18)
    defevent choose(:set_17_option_2), do: next_state(:set_19)
    defevent choose(:set_17_option_3), do: next_state(:set_20)
  end

  defstate set_18 do
    defevent choose(:set_18_option_1), do: next_state(:set_17)
    defevent choose(:set_18_option_2), do: next_state(:set_19)
    defevent choose(:set_18_option_3), do: next_state(:set_20)
  end

  defstate set_19 do
    defevent choose(:set_19_option_1), do: next_state(:set_17)
    defevent choose(:set_19_option_2), do: next_state(:set_18)
    defevent choose(:set_19_option_3), do: next_state(:set_20)
  end

  defstate set_20 do
    defevent choose(:set_20_option_1), do: next_state(:set_22)
    defevent choose(:set_20_option_2), do: next_state(:set_23)
    defevent choose(:set_20_option_3), do: next_state(:set_21)
  end

  defstate set_21 do
    defevent choose(:set_21_option_1), do: next_state(:set_17)
    defevent choose(:set_21_option_2), do: next_state(:set_18)
    defevent choose(:set_21_option_3), do: next_state(:set_18)
  end

  defstate set_22 do
    defevent choose(:set_22_option_1), do: next_state(:set_24)
  end

  defstate set_23 do
    defevent choose(:set_23_option_1), do: next_state(:set_24)
  end

  defstate set_24 do
    defevent choose(:set_24_option_1), do: next_state(:set_25)
  end

  defstate set_25 do
    defevent choose(:set_25_option_1), do: next_state(:set_1)
  end

  defevent restart do
    next_state(:set_1)
  end

  defevent _, state: state do
    next_state(state)
  end
end
