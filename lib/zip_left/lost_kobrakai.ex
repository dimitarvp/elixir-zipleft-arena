defmodule ZipLeft.LostKobrakai do
  def pair_with_unfold(l0, l1) do
    Stream.unfold({l0, l1, l1}, fn
      {[], _, _l1} ->
        nil

      {[head_l0 | rest_l0], [], [head_l1 | rest_l1] = l1} ->
        {{head_l0, head_l1}, {rest_l0, rest_l1, l1}}

      {[head_l0 | rest_l0], [head_l1 | rest_l1], l1} ->
        {{head_l0, head_l1}, {rest_l0, rest_l1, l1}}
    end)
    |> Enum.to_list()
  end

  def pair_with_recursion(l0, l1) do
    pair_with_recursion(l0, l1, l1, [])
  end

  defp pair_with_recursion([], _, _l1, acc) do
    Enum.reverse(acc)
  end

  defp pair_with_recursion(
         [head_l0 | rest_l0],
         [],
         [head_l1 | rest_l1] = l1,
         acc
       ) do
    pair_with_recursion(rest_l0, rest_l1, l1, [{head_l0, head_l1} | acc])
  end

  defp pair_with_recursion([head_l0 | rest_l0], [head_l1 | rest_l1], l1, acc) do
    pair_with_recursion(rest_l0, rest_l1, l1, [{head_l0, head_l1} | acc])
  end
end
