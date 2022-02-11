defmodule ZipLeft.Eksperimental do
  def pair_with_tail_recursion_micro_optimized([h0 | t0] = _l0, [h1 | t1] = l1),
    do: pair_with_tail_recursion_micro_optimized(t0, t1, l1, [{h0, h1}])

  def pair_with_tail_recursion_micro_optimized(_l0, _l1), do: []

  defp pair_with_tail_recursion_micro_optimized([h0 | t0], [h1 | t1], l1, acc),
    do: pair_with_tail_recursion_micro_optimized(t0, t1, l1, [{h0, h1} | acc])

  defp pair_with_tail_recursion_micro_optimized([h0 | t0], [], [h1 | t1] = l1, acc),
    do: pair_with_tail_recursion_micro_optimized(t0, t1, l1, [{h0, h1} | acc])

  defp pair_with_tail_recursion_micro_optimized([], _, _, acc),
    do: :lists.reverse(acc)
end
