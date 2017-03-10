
defmodule Cryptopals.AesHelpersSpec do
  use ESpec

  let :key, do: "YELLOW SUBMARINE"
  let :repeating_ctxt, do: :crypto.block_encrypt(:aes_ecb, key(), '1234567890123456' |> Stream.cycle |> Enum.take(160)) |> :erlang.binary_to_list
  let :other_repeating_ctxt, do: :crypto.block_encrypt(:aes_ecb, key(), '12345678901234560987654321098765' |> Stream.cycle |> Enum.take(160)) |> :erlang.binary_to_list

  subject(Cryptopals.AesHelpers)

  context ".count_blocks" do
    it "should count 10 blocks in repeating ctxt" do
      expect(subject().count_blocks(repeating_ctxt())) |> to(eq %{:crypto.block_encrypt(:aes_ecb, key(), '1234567890123456') |> :erlang.binary_to_list => 10})
    end

    it "should count 5 and 5 blocks in the other repeating ctxt" do
      expect(subject().count_blocks(other_repeating_ctxt())) |> to(eq %{:crypto.block_encrypt(:aes_ecb, key(), '1234567890123456') |> :erlang.binary_to_list => 5,
                                                                        :crypto.block_encrypt(:aes_ecb, key(), '0987654321098765') |> :erlang.binary_to_list => 5})
    end
  end
end
