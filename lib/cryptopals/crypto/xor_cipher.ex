defmodule Cryptopals.Crypto.XorCipher do
  import Cryptopals.Utils.Data

  def encode(cipher_text, key) do
    xor(cipher_text, Stream.cycle(key))
  end
end
