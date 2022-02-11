defmodule ZipLeft.DerekZhou do
  def pair_with_body_recursion(l0, l1) do
    pair_recursion(l0, l1, l1)
  end

  defp pair_recursion([], _, _), do: []
  defp pair_recursion(l0, [], l1), do: pair_recursion(l0, l1, l1)

  defp pair_recursion([h0 | t0], [h1 | t1], l1) do
    [{h0, h1} | pair_recursion(t0, t1, l1)]
  end

  def pair_with_tail_recursion(list0, list1) do
    Enum.reverse(pair_tail_recursion(list0, list1, list1, []))
  end

  defp pair_tail_recursion([], _, _, acc), do: acc

  defp pair_tail_recursion([h0 | t0], [], [h1 | t1], acc),
    do: pair_tail_recursion(t0, t1, [h1 | t1], [{h0, h1} | acc])

  defp pair_tail_recursion([h0 | t0], [h1 | t1], l1, acc) do
    pair_tail_recursion(t0, t1, l1, [{h0, h1} | acc])
  end
end
