defmodule Cryptopals.Challenges.C4Spec do
  use ESpec
  alias Cryptopals.Utils.Convert

  let :ctxt do
    File.read!("spec/cryptopals/challenges/support/challenge_4.txt")
    |> String.split
    |> Enum.map(&Convert.hex_to_binary/1)
  end
  let :ptxt, do: 'Now that the party is jumping\n'

  it "should find and decrypt the cipher text in the file" do
    expect(described_module().solve(ctxt())) |> to(eq ptxt())
  end
end
