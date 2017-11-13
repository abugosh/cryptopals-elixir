defmodule Cryptopals.Challenges.C7 do
  def solve(ctxt, key) do
    :crypto.block_decrypt(:aes_ecb, key, ctxt)
  end
end
