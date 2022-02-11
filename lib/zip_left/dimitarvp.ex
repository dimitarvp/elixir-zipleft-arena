defmodule ZipLeft.DimitarVP do
  def pair_with_enum_reduce(l0, l1) do
    l1_tuple = List.to_tuple(l1)
    l1_last_position = tuple_size(l1_tuple) - 1

    Enum.reduce(l0, {[], 0}, fn item, {final_list, position} ->
      mapped_item = {item, elem(l1_tuple, position)}

      position =
        case position do
          ^l1_last_position ->
            0

          _ ->
            position + 1
        end

      {[mapped_item | final_list], position}
    end)
    |> elem(0)
    |> Enum.reverse()
  end

  def pair_with_stream_cycle(l0, l1) do
    stream = Stream.cycle(l1)
    Enum.zip(l0, Enum.take(stream, length(l0)))
  end

  def pair_with_stream_cycle_and_zip(l0, l1) do
    {l1, l0} = Enum.min_max_by([l0, l1], &length(&1))

    l0
    |> Stream.zip(Stream.cycle(l1))
    |> Enum.to_list()
  end

  def pair_recursively(l0, l1) do
    {l1, l0} = Enum.min_max_by([l0, l1], &length(&1))
    l1_tuple = List.to_tuple(l1)
    l1_last_position = tuple_size(l1_tuple) - 1

    do_pair_recursively(l0, l1_tuple, 0, l1_last_position)
  end

  defp do_pair_recursively([item | rest], other_items, other_max_position, other_max_position) do
    [
      {item, elem(other_items, other_max_position)}
      | do_pair_recursively(rest, other_items, 0, other_max_position)
    ]
  end

  defp do_pair_recursively([item | rest], other_items, other_position, other_max_position) do
    [
      {item, elem(other_items, other_position)}
      | do_pair_recursively(rest, other_items, other_position + 1, other_max_position)
    ]
  end

  defp do_pair_recursively([], _, _, _), do: []
end
