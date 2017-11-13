defmodule Cryptopals.Challenges.C5 do
  alias Cryptopals.Crypto.XorCipher

  def solve(ptxt, key) do
    XorCipher.encode(ptxt, key)
  end
end
