defmodule Cryptopals.Challenges.C7Spec do
  use ESpec
  alias Cryptopals.Utils.Convert

  let :ctxt, do: Convert.base64_file_to_binary("spec/cryptopals/challenges/support/challenge_7.txt")
  let :ptxt, do: File.read!("spec/cryptopals/challenges/support/challenge_7_plain.txt")

  let :key, do: 'YELLOW SUBMARINE'

  it "should decrypt the ctxt using the key" do
    expect(described_module().solve(ctxt(), key())) |> to(eq ptxt())
  end
end
