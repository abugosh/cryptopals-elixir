defmodule Cryptopals.Cryptanalysis.RepeatingKeyXor do
  alias Cryptopals.Crypto.XorCipher
  alias Cryptopals.Utils.AsciiPlaintext

  @doc """
  Score the provided txt by enciphering with each key and scoring for ascii plaintext.
  """
  def score_keys(txt, keys) do
    keys
    |> Enum.map(fn (key) ->
      encoded_txt = XorCipher.encode(txt, List.wrap([key]))
      {key, AsciiPlaintext.score(encoded_txt), encoded_txt}
    end)
  end
end
