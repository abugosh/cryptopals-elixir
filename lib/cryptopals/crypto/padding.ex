defmodule Cryptopals.Crypto.Padding do
  def pad_block(block, len) do
    padding_length = len - Enum.count(block)

    block ++ ([padding_length] |> Stream.cycle |> Enum.take(padding_length))
  end
end
