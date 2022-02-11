defmodule ZipLeft.Moogle19 do
  def pair_with_tail_recursion_two_way(l0, l1) do
    Enum.reverse(pair_tail_recursion_two_way(l0, l1, l0, l1, []))
  end

  defp pair_tail_recursion_two_way([], _l1, [], _c1, acc), do: acc
  defp pair_tail_recursion_two_way(_l0, [], _c0, [], acc), do: acc

  defp pair_tail_recursion_two_way([], l1, c0, _c1, acc),
    do: pair_tail_recursion_two_way(c0, l1, c0, [], acc)

  defp pair_tail_recursion_two_way(l0, [], _c0, c1, acc),
    do: pair_tail_recursion_two_way(l0, c1, [], c1, acc)

  defp pair_tail_recursion_two_way([h0 | t0], [h1 | t1], c0, c1, acc) do
    pair_tail_recursion_two_way(t0, t1, c0, c1, [{h0, h1} | acc])
  end
end
