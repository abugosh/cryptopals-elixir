
defmodule Cryptopals.Crypto.Cbc do
  import Cryptopals.Utils.Data

  def decrypt(ctxt, key, ivec) do
    data = ctxt |> Enum.chunk(16)

    data
    |> Enum.zip([ivec] ++ data)
    |> Enum.flat_map(fn {cur, prev} ->
      :aes_ecb
      |> :crypto.block_decrypt(key, cur)
      |> :erlang.binary_to_list
      |> xor(prev)
    end)
  end

  def encrypt(ptxt, key, ivec) do
    {encrypted, _} = ptxt
    |> Enum.chunk(16)
    |> Enum.reduce({[], ivec}, fn (x, {ctxt, prev}) ->
      block = :aes_ecb
              |> :crypto.block_encrypt(key, xor(x, prev))
              |> :erlang.binary_to_list

      {ctxt ++ block, block}
    end)

    encrypted
  end
end
