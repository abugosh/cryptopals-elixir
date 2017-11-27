defmodule Cryptopals.Crypto.Padding do
  def pad_block([], _), do: []
  def pad_block(block, len) when length(block) == len, do: block
  def pad_block(block, len) do
    padding_length = len - Enum.count(block)

    block ++ ([padding_length] |> Stream.cycle |> Enum.take(padding_length))
  end

  def pad_text(txt, block_size) do
    base = (txt |> Enum.count |> div(block_size)) * block_size

    {head, tail} = txt |> Enum.split(base)

    head ++ pad_block(tail, block_size)
  end
end
