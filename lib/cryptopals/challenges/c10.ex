defmodule Cryptopals.Challenges.C10 do
  alias Cryptopals.Crypto.Cbc

  def decrypt(ctxt, key, ivec) do
    Cbc.decrypt(ctxt, key, ivec)
  end

  def encrypt(ptxt, key, ivec) do
    Cbc.encrypt(ptxt, key, ivec)
  end
end
