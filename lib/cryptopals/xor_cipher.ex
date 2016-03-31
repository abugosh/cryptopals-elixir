
defmodule Cryptopals.XorCipher do
  import Cryptopals.XorHelpers

  def encode(cipher_text, key) do
    xor(cipher_text, Stream.cycle(key))
  end
end
