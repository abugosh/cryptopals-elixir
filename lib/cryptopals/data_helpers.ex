defmodule Cryptopals.DataHelpers do

  def count_blocks(ctxt) do
    ctxt
    |> Enum.chunk(16)
    |> Enum.group_by(&(&1))
    |> Enum.map(fn {k, v} -> {k, Enum.count(v)} end)
    |> Map.new
  end

  def random_key(len \\ 16) do
    len
    |> :crypto.strong_rand_bytes
    |> :erlang.binary_to_list
  end
end
