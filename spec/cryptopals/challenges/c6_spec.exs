defmodule Cryptopals.Challenges.C6Spec do
  use ESpec
  alias Cryptopals.Utils.Convert

  let :ctxt, do: Convert.base64_file_to_binary("spec/cryptopals/challenges/support/challenge_6.txt")
  let :key_size, do: 29
  let :the_key, do: 'Terminator X: Bring the noise'

  context ".find_key_size" do
    it "should find the key size" do
      expect(described_module().find_key_size(ctxt())) |> to(eq key_size())
    end
  end

  it "should find and decrypt the cipher text in the file" do
    expect(described_module().solve(ctxt())) |> to(eq the_key())
  end
end
