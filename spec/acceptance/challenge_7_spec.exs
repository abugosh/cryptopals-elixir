
defmodule Cryptopals.Challenge7Spec do
  use ESpec

  let :ctxt, do: Cryptopals.Convert.base64_file_to_binary("spec/acceptance/support/challenge_7.txt")
  let :ptxt, do: File.read!("spec/acceptance/support/challenge_7_plain.txt")

  let :key, do: 'YELLOW SUBMARINE'

  it "should decrypt the ctxt using the key" do
    expect(:crypto.block_decrypt(:aes_ecb, key(), ctxt())) |> to(eq ptxt())
  end
end
