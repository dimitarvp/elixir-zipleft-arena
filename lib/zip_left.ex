defmodule ZipLeft do
  @moduledoc """
  This module exercises different implementations of the following problem:

  We want to zip two lists where the first one is always bigger or equal in size
  compared to the second one, while also cycling through the second list like so:

  ```
  list0 = [1, 2, 3, 4, 5]
  list1 = [:a, :b]

  result = [{1, :a}, {2, :b}, {3, :a}, {4, :b}, {5, :a}]
  ```

  Just call the `bench` function to run benchmark on all functions that implement
  the algorithm. The inputs are hardcoded, feel free to modify them and test
  different ones.
  """

  alias __MODULE__.{DerekZhou, DimitarVP, Eksperimental, LostKobrakai, Moogle19}

  def bench() do
    l0 = Enum.to_list(1..2000)
    l1 = [:worker_0, :worker_1, :worker_2, :worker_3, :worker_4]

    Benchee.run(%{
      "dimitarvp.pair_with_enum_reduce" => fn -> DimitarVP.pair_with_enum_reduce(l0, l1) end,
      "dimitarvp.pair_with_stream_cycle" => fn -> DimitarVP.pair_with_stream_cycle(l0, l1) end,
      "dimitarvp.pair_with_stream_cycle_and_zip" => fn ->
        DimitarVP.pair_with_stream_cycle_and_zip(l0, l1)
      end,
      "dimitarvp.pair_recursively" => fn -> DimitarVP.pair_recursively(l0, l1) end,
      "DerekZhou.pair_with_body_recursion" => fn ->
        DerekZhou.pair_with_body_recursion(l0, l1)
      end,
      "DerekZhou.pair_with_tail_recursion" => fn ->
        DerekZhou.pair_with_tail_recursion(l0, l1)
      end,
      "moogle19.pair_with_tail_recursion_two_way" => fn ->
        Moogle19.pair_with_tail_recursion_two_way(l0, l1)
      end,
      "LostKobrakai.pair_with_unfold" => fn -> LostKobrakai.pair_with_unfold(l0, l1) end,
      "LostKobrakai.pair_with_recursion" => fn ->
        LostKobrakai.pair_with_recursion(l0, l1)
      end,
      "eksperimental.pair_with_tail_recursion_micro_optimized" => fn ->
        Eksperimental.pair_with_tail_recursion_micro_optimized(l0, l1)
      end
    })
  end
end
