require IEx
defmodule Cryptopals.Challenge4Spec do
  use ESpec

  let :ctxt do
    File.read!("spec/acceptance/support/challenge_4.txt")
    |> String.split
    |> Enum.map(&Cryptopals.Convert.hex_to_binary/1)
  end

  let :ptxt, do: 'Now that the party is jumping\n'

  def score_cipher_text(txt) do
    (0..255)
    |> Enum.map(fn (key) ->
      encoded_txt = Cryptopals.XorCipher.encode(txt, [key])
      {key, Cryptopals.AsciiPlaintextHelpers.score(encoded_txt), encoded_txt}
    end)
  end

  it "should find and decrypt the cipher text in the file" do
    {_, _, plain_text} = (ctxt
                          |> Enum.flat_map(&score_cipher_text/1)
                          #|> Enum.flat_map(fn(x) -> x end)
                          |> Enum.max_by(fn ({_, score, _}) -> score end))

    expect(plain_text) |> to(eq ptxt)
  end
end
