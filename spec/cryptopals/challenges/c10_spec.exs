defmodule Cryptopals.Challenges.C10Spec do
  use ESpec
  alias Cryptopals.Utils.Convert

  let :key, do: 'YELLOW SUBMARINE'
  let :ivec, do: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

  let :ctxt, do: Convert.base64_file_to_binary("spec/cryptopals/challenges/support/challenge_10.txt")
  let :ptxt, do: :crypto.block_decrypt(:aes_cbc128, key(), ivec() |> :erlang.list_to_binary, ctxt()) |> :erlang.binary_to_list

  it "should decrypt the ctxt using the key" do
    expect(described_module().decrypt(ctxt(), key(), ivec())) |> to(eq ptxt())
  end

  it "should encrypt the ptxt using the key" do
    expect(described_module().encrypt(ptxt(), key(), ivec())) |> to(eq ctxt())
  end
end
