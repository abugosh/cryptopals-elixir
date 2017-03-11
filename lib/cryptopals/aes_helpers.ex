
defmodule Cryptopals.AesHelpers do

  def count_blocks(ctxt) do
    ctxt
    |> Enum.chunk(16)
    |> Enum.group_by(&(&1))
    |> Enum.map(fn {k, v} -> {k, Enum.count(v)} end)
    |> Map.new
  end

  def random_key(length \\ 16) do
    :crypto.strong_rand_bytes(length) |> :erlang.binary_to_list
  end
end
