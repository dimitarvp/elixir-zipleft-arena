# ZipLeft

This is an unified project encompassing all solutions proposed in this ElixirForum thread:

https://elixirforum.com/t/can-you-improve-this-zipping-two-lists-the-result-must-be-same-size-as-the-first-list/45800

The algorithm should do the following:

Given inputs `[1, 2, 3, 4, 5]` and `[:a, :b]` it should return this:

```elixir
[{1, :a}, {2, :b}, {3, :a}, {4, :b}, {5, :a}]
```

To run the benchmarks: clone this repo, run `mix deps.get`, then `mix run -e 'ZipLeft.bench'`.

As of 2022-FEB-12, on my machine the result is (Elixir is at `1.13.3-otp-24`, Erlang at `24.2.1`):

```plain
Name                                                             ips        average  deviation         median         99th %
eksperimental.pair_with_tail_recursion_micro_optimized       63.53 K       15.74 μs    ±51.42%          12 μs          37 μs
LostKobrakai.pair_with_recursion                             63.07 K       15.86 μs    ±49.42%          12 μs          37 μs
DerekZhou.pair_with_tail_recursion                           62.52 K       15.99 μs    ±51.71%          12 μs          38 μs
moogle19.pair_with_tail_recursion_two_way                    58.59 K       17.07 μs    ±47.76%          13 μs          39 μs
DerekZhou.pair_with_body_recursion                           42.77 K       23.38 μs    ±35.05%          20 μs          46 μs
dimitarvp.pair_recursively                                   30.49 K       32.80 μs    ±26.47%          30 μs          55 μs
dimitarvp.pair_with_enum_reduce                              21.16 K       47.27 μs    ±25.60%          48 μs          76 μs
LostKobrakai.pair_with_unfold                                10.63 K       94.06 μs    ±29.41%          87 μs      220.10 μs
dimitarvp.pair_with_stream_cycle                             10.01 K       99.88 μs    ±21.10%          98 μs         177 μs
dimitarvp.pair_with_stream_cycle_and_zip                      2.34 K      427.21 μs    ±22.18%         397 μs         907 μs

Comparison:
eksperimental.pair_with_tail_recursion_micro_optimized       63.53 K
LostKobrakai.pair_with_recursion                             63.07 K - 1.01x slower +0.115 μs
DerekZhou.pair_with_tail_recursion                           62.52 K - 1.02x slower +0.25 μs
moogle19.pair_with_tail_recursion_two_way                    58.59 K - 1.08x slower +1.33 μs
DerekZhou.pair_with_body_recursion                           42.77 K - 1.49x slower +7.64 μs
dimitarvp.pair_recursively                                   30.49 K - 2.08x slower +17.06 μs
dimitarvp.pair_with_enum_reduce                              21.16 K - 3.00x slower +31.53 μs
LostKobrakai.pair_with_unfold                                10.63 K - 5.98x slower +78.32 μs
dimitarvp.pair_with_stream_cycle                             10.01 K - 6.35x slower +84.14 μs
dimitarvp.pair_with_stream_cycle_and_zip                      2.34 K - 27.14x slower +411.47 μs
```
