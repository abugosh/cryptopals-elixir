
defmodule Cryptopals.Challenge3Spec do
  use ESpec

  let :ctxt, do: Cryptopals.Convert.hex_to_binary "1b37373331363f78151b7f2b783431333d78397828372d363c78373e783a393b3736"
  let :key, do: 88

  it "should find the key" do
    {found_key, _} = ((0..255)
    |> Enum.map(&({&1, Cryptopals.XorCipher.encode(ctxt(), [&1]) |> Cryptopals.AsciiPlaintextHelpers.score}))
    |> Enum.max_by(fn ({_, score}) -> score end))

    expect(found_key) |> to(eq key())
  end
end
