
defmodule Cryptopals.AesCbc do
  import Cryptopals.XorHelpers

  def decrypt(ctxt, key, ivec) do
    data = ctxt |> Enum.chunk(16)

    data
    |> Enum.zip([ivec] ++ data)
    |> Enum.flat_map(fn {cur, prev} ->
      :crypto.block_decrypt(:aes_ecb, key, cur) |> :erlang.binary_to_list |> xor(prev)
    end)
  end

  def encrypt(ptxt, key, ivec) do
    {encrypted, _} = ptxt
    |> Enum.chunk(16)
    |> Enum.reduce({[], ivec}, fn (x, {ctxt, prev}) ->
      block = :crypto.block_encrypt(:aes_ecb, key, xor(x, prev)) |> :erlang.binary_to_list
      {ctxt ++ block, block}
    end)

    encrypted
  end
end
