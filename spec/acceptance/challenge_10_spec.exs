
defmodule Cryptopals.Challenge10Spec do
  use ESpec

  let :key, do: 'YELLOW SUBMARINE'
  let :ivec, do: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

  let :ctxt, do: Cryptopals.Convert.base64_file_to_binary("spec/acceptance/support/challenge_10.txt")
  let :ptxt, do: :crypto.block_decrypt(:aes_cbc128, key, ivec |> :erlang.list_to_binary, ctxt) |> :erlang.binary_to_list


  xit "should decrypt the ctxt using the key" do
    expect(Cryptopals.AesCbc.decrypt(ctxt, key, ivec)) |> to(eq ptxt)
  end
end
