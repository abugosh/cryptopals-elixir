defmodule Cryptopals.DataHelpersSpec do
  use ESpec

  let :key, do: "YELLOW SUBMARINE"
  let :repeating_ctxt, do: :crypto.block_encrypt(:aes_ecb, key(), '1234567890123456' |> Stream.cycle |> Enum.take(160)) |> :erlang.binary_to_list
  let :other_repeating_ctxt, do: :crypto.block_encrypt(:aes_ecb, key(), '12345678901234560987654321098765' |> Stream.cycle |> Enum.take(160)) |> :erlang.binary_to_list

  subject(Cryptopals.DataHelpers)

  context ".count_blocks" do
    it "should count 10 blocks in repeating ctxt" do
      expect(subject().count_blocks(repeating_ctxt())) |> to(eq %{:crypto.block_encrypt(:aes_ecb, key(), '1234567890123456') |> :erlang.binary_to_list => 10})
    end

    it "should count 5 and 5 blocks in the other repeating ctxt" do
      expect(subject().count_blocks(other_repeating_ctxt())) |> to(eq %{:crypto.block_encrypt(:aes_ecb, key(), '1234567890123456') |> :erlang.binary_to_list => 5,
                                                                        :crypto.block_encrypt(:aes_ecb, key(), '0987654321098765') |> :erlang.binary_to_list => 5})
    end
  end

  context ".random_bytes" do
    it "returns a length of bytes" do
      expect(Enum.count(subject().random_bytes(16))) |> to(eq 16)
      expect(Enum.count(subject().random_bytes(256))) |> to(eq 256)
      expect(Enum.count(subject().random_bytes(1337))) |> to(eq 1337)
    end

    it "gets the bytes from the crypto library" do
      allow :crypto |> to(accept :strong_rand_bytes, fn(_) -> "" end)
      subject().random_bytes(1)
      expect(:crypto) |> to(accepted :strong_rand_bytes)
    end
  end
end
