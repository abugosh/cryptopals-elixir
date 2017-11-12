defmodule Cryptopals.Utils.Data do
  use Bitwise

  @doc """
  Counts the number of each unique block.
  """
  def count_blocks(ctxt) do
    ctxt
    |> Enum.chunk(16)
    |> Enum.group_by(&(&1))
    |> Enum.map(fn {k, v} -> {k, Enum.count(v)} end)
    |> Map.new
  end

  @doc """
  Supplies the length of random bytes.
  """
  def random_bytes(len) do
    len
    |> :crypto.strong_rand_bytes
    |> :erlang.binary_to_list
  end

  @doc """
  Xor's the supplied lists with one another.
  """
  def xor(x, y) do
    x
    |> Enum.zip(y)
    |> Enum.map(fn {a, b} -> a ^^^ b end)
  end
end
