defmodule Cryptopals.Challenges.C8Spec do
  use ESpec
  alias Cryptopals.Utils.Convert

  let :ctxt do
    File.read!("spec/cryptopals/challenges/support/challenge_8.txt")
    |> String.split("\n", trim: true)
    |> Enum.map(&Convert.hex_to_binary/1)
  end
  let :target, do: Convert.hex_to_binary("d880619740a8a19b7840a8a31c810a3d08649af70dc06f4fd5d2d69c744cd283e2dd052f6b641dbf9d11b0348542bb5708649af70dc06f4fd5d2d69c744cd2839475c9dfdbc1d46597949d9c7e82bf5a08649af70dc06f4fd5d2d69c744cd28397a93eab8d6aecd566489154789a6b0308649af70dc06f4fd5d2d69c744cd283d403180c98c8f6db1f2a3f9c4040deb0ab51b29933f2c123c58386b06fba186a")

  it "should look for repeating blocks in the ctxt" do
    expect(described_module().solve(ctxt())) |> to(eq target())
  end
end
