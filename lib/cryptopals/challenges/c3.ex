defmodule Cryptopals.Challenges.C3 do
  alias Cryptopals.Crypto.XorCipher
  alias Cryptopals.Utils.AsciiPlaintext

  def solve(ctxt) do
    (0..255)
    |> Enum.map(&({&1, ctxt |> XorCipher.encode([&1]) |> AsciiPlaintext.score}))
    |> Enum.max_by(fn ({_, score}) -> score end)
    |> elem(0)
  end
end
