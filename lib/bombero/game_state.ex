defmodule Bombero.GameState do
  use Fsm, initial_state: :waiting_to_start, initial_data: %Bombero.GameStateData{}

  alias Bombero.GameStateData

  def new(id) do
    data = %GameStateData{id: id}
    %{ new | data: data }
  end

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
    defevent choose(:set_25_option_1), do: next_state(:set_26)
  end

  defstate set_26 do
    defevent choose(:set_26_option_1), do: next_state(:set_30)
    defevent choose(:set_26_option_2), do: next_state(:set_27)
  end

  defstate set_27 do
    defevent choose(:set_27_option_1), do: next_state(:set_26)
    defevent choose(:set_27_option_2), do: next_state(:set_28)
  end

  defstate set_28 do
    defevent choose(:set_28_option_1), do: next_state(:set_29)
    defevent choose(:set_28_option_2), do: next_state(:set_29)
    defevent choose(:set_28_option_3), do: next_state(:set_29)
  end

  defstate set_29 do
    defevent choose(:set_29_option_1), do: next_state(:set_30)
  end

  defstate set_30 do
    defevent choose(:set_30_option_1), do: next_state(:set_31)
    defevent choose(:set_30_option_2), do: next_state(:set_34)
  end

  # The branch from Set 31, Option 2 is supposed to test a flag:
  #   If Option 2 is chosen and armorWorn == False, goto Set 34
  #   else goto Set 37
  defstate set_31 do
    defevent choose(:set_31_option_1), do: next_state(:set_32)
    defevent choose(:set_31_option_2), do: next_state(:set_34)
  end

  # The branch from Set 32, Option 1 is supposed to test a flag:
  #   If Option 1 is chosen and platePolished == False, goto Set 33
  #   else goto Set 36
  # The branch from Set 32, Option 2 is supposed to test a flag:
  #   If Option 2 is chosen and armorWorn == False, goto Set 34
  #   else goto Set 37
  defstate set_32 do
    defevent choose(:set_32_option_1), do: next_state(:set_33)
    defevent choose(:set_32_option_2), do: next_state(:set_34)
  end

  # The branch from Set 33, Option 1 is supposed to test a flag:
  #   If Option 1 is chosen and armorWorn == False, goto Set 34
  #   else goto Set 37
  defstate set_33 do
    defevent choose(:set_33_option_1), do: next_state(:set_34)
  end

  # The branch from Set 34, Option 1 is supposed to test a flag:
  #   If Option 1 is chosen and boxOpened == True, goto Set 35
  #   else goto Set 38
  defstate set_34 do
    defevent choose(:set_34_option_1), do: next_state(:set_38)
    defevent choose(:set_34_option_2), do: next_state(:set_39)
  end

  # The branch from Set 35, Option 2 is supposed to test a flag:
  #   If Option 2 is chosen and armorWorn == False, goto Set 34
  #   else goto Set 37
  defstate set_35 do
    defevent choose(:set_35_option_1), do: next_state(:set_32)
    defevent choose(:set_35_option_2), do: next_state(:set_34)
  end

  # The branch from Set 36, Option 1 is supposed to test a flag:
  #   If Option 1 is chosen and armorWorn == False, goto Set 34
  #   else goto Set 37
  defstate set_36 do
    defevent choose(:set_36_option_1), do: next_state(:set_34)
  end

  defstate set_37 do
    defevent choose(:set_37_option_1), do: next_state(:set_39)
  end

  # The branch from Set 38, Option 2 is supposed to test a flag:
  #   If Option 2 is chosen and armorWorn == False, goto Set 34
  #   else goto Set 37
  defstate set_38 do
    defevent choose(:set_38_option_1), do: next_state(:set_31)
    defevent choose(:set_38_option_2), do: next_state(:set_34)
  end

  defstate set_39 do
    defevent choose(:set_39_option_1), do: next_state(:set_41)
    defevent choose(:set_39_option_2), do: next_state(:set_40)
  end

  defstate set_40 do
    defevent choose(:set_40_option_1), do: next_state(:set_40a)
    defevent choose(:set_40_option_2), do: next_state(:set_40b)
  end

  defstate set_40a do
    defevent choose(:set_40a_option_1), do: next_state(:set_41)
    defevent choose(:set_40a_option_2), do: next_state(:set_40)
  end

  defstate set_40b do
    defevent choose(:set_40b_option_1), do: next_state(:set_42)
    defevent choose(:set_40b_option_2), do: next_state(:set_40)
  end

  defstate set_41 do
    defevent choose(:set_41_option_1), do: next_state(:set_53)
  end

  defstate set_42 do
    defevent choose(:set_42_option_1), do: next_state(:set_43)
    defevent choose(:set_42_option_2), do: next_state(:set_41)
  end

  defstate set_43 do
    defevent choose(:set_43_option_1), do: next_state(:set_44)
    defevent choose(:set_43_option_2), do: next_state(:set_45)
    defevent choose(:set_43_option_3), do: next_state(:set_50)
  end

  defstate set_44 do
    defevent choose(:set_44_option_1), do: next_state(:set_41)
  end

  defstate set_45 do
    defevent choose(:set_45_option_1), do: next_state(:set_46)
  end

  defstate set_46 do
    defevent choose(:set_46_option_1), do: next_state(:set_47)
    defevent choose(:set_46_option_2), do: next_state(:set_48)
  end

  defstate set_47 do
    defevent choose(:set_47_option_1), do: next_state(:set_48)
    defevent choose(:set_47_option_2), do: next_state(:set_49)
  end

  defstate set_48 do
    defevent choose(:set_48_option_1), do: next_state(:set_47)
    defevent choose(:set_48_option_2), do: next_state(:set_49)
  end

  defstate set_49 do
    defevent choose(:set_49_option_1), do: next_state(:set_41)
  end

  defstate set_50 do
    defevent choose(:set_50_option_1), do: next_state(:set_51)
  end

  defstate set_51 do
    defevent choose(:set_51_option_1), do: next_state(:set_52)
  end

  defstate set_52 do
    defevent choose(:set_52_option_1), do: next_state(:set_41)
  end

  defstate set_53 do
    defevent choose(:set_53_option_1), do: next_state(:set_1)
  end

  defevent restart do
    next_state(:set_1)
  end

  defevent _, state: state do
    next_state(state)
  end
end

# Copy + paste from Enumerable.Map for Mongo's benefit
defimpl Enumerable, for: Bombero.GameState do
  def reduce(map, acc, fun) do
    do_reduce(:maps.to_list(map), acc, fun)
  end

  defp do_reduce(_,     {:halt, acc}, _fun),   do: {:halted, acc}
  defp do_reduce(list,  {:suspend, acc}, fun), do: {:suspended, acc, &do_reduce(list, &1, fun)}
  defp do_reduce([],    {:cont, acc}, _fun),   do: {:done, acc}
  defp do_reduce([h|t], {:cont, acc}, fun),    do: do_reduce(t, fun.(h, acc), fun)

  def member?(map, {key, value}) do
    {:ok, match?({:ok, ^value}, :maps.find(key, map))}
  end

  def member?(_map, _other) do
    {:ok, false}
  end

  def count(map) do
    {:ok, map_size(map)}
  end
end
