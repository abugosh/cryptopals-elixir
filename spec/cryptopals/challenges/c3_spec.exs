defmodule Cryptopals.Challenges.C3Spec do
  use ESpec
  alias Cryptopals.Utils.Convert

  let :ctxt, do: Convert.hex_to_binary "1b37373331363f78151b7f2b783431333d78397828372d363c78373e783a393b3736"
  let :key, do: 88

  it "should find the key" do
    expect(described_module().solve(ctxt())) |> to(eq key())
  end
end
