defmodule Cryptopals.Crypto.Padding do
  def pad_block(block, len, padding_byte \\ 4) do
    block ++ ([padding_byte] |> Stream.cycle |> Enum.take(len - Enum.count(block)))
  end
end
