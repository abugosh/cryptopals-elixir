defmodule Cryptopals.Challenges.C4 do
  alias Cryptopals.Crypto.XorCipher
  alias Cryptopals.Cryptanalysis.RepeatingKeyXor
  alias Cryptopals.Utils.AsciiPlaintext

  def solve(ctxt) do
    ctxt
    #|> Enum.flat_map(&score_cipher_text/1)
    |> Enum.flat_map(&RepeatingKeyXor.score_keys(&1, 0..255))
    |> Enum.max_by(fn ({_, score, _}) -> score end)
    |> elem(2)
  end

  defp score_cipher_text(txt) do
    (0..255)
    |> Enum.map(fn (key) ->
      encoded_txt = XorCipher.encode(txt, [key])
      {key, AsciiPlaintext.score(encoded_txt), encoded_txt}
    end)
  end
end
