defmodule Cryptopals.Challenges.C9 do
  alias Cryptopals.Crypto.Padding
  def solve(txt, len) do
    Padding.pad_block(txt, len)
  end
end
