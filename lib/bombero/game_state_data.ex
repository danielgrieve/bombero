defmodule Bombero.GameStateData do
  defstruct id: 0
end

# Copy + paste from Enumerable.Map for Mongo's benefit
defimpl Enumerable, for: Bombero.GameStateData do
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
