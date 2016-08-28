
defmodule Cryptopals.AesHelpers do

  def count_blocks(ctxt) do
    ctxt
    |> Enum.chunk(16)
    |> Enum.group_by(&(&1))
    |> Enum.map(fn {k, v} -> {k, Enum.count(v)} end)
    |> Map.new
  end
end
