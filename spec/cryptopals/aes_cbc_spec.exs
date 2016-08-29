
defmodule Cryptopals.AesCbcSpec do
  use ESpec

  let :key, do: 'YELLOW SUBMARINE'
  let :block, do: '1234567890123456'
  let :encrypted_block, do: :crypto.block_encrypt(:aes_ecb, key, block) |> :erlang.binary_to_list
  let :null_block, do: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
  let :encrypted_null_block, do: :crypto.block_encrypt(:aes_ecb, key, null_block) |> :erlang.binary_to_list

  subject(Cryptopals.AesCbc)

  context ".decrypt" do
    it "will apply aes_ecb to first block with null ivec" do
      expect(subject.decrypt(block, key, null_block)) |> to(eq :crypto.block_decrypt(:aes_ecb, key, block) |> :erlang.binary_to_list)
    end

    it "will apply aes_ecb to first block and xor it with the ivec" do
      expect(subject.decrypt(encrypted_null_block, key, block)) |> to(eq block)
    end

    it "will apply aes_ecb to second block and xor it with the first ctxt" do
      [_, ctxt] = subject.decrypt(encrypted_null_block ++ encrypted_null_block, key, null_block) |> Enum.chunk(16)

      expect(ctxt) |> to(eq encrypted_null_block)
    end
  end

  context ".encrypt" do
    it "will apply aes_ecb to the first block with null ivec" do
      expect(subject.encrypt(block, key, null_block)) |> to(eq encrypted_block)
    end

    it "will apply aes_ecb to the first block after xoring it with the ivec" do
      expect(subject.encrypt(null_block, key, block)) |> to(eq encrypted_block)
    end

    it "will apply aes_ecb to the second block after xoring it with the first ctxt" do
      [_, ctxt] = subject.encrypt(block ++ null_block, key, null_block) |> Enum.chunk(16)

      expect(ctxt) |> to(eq :crypto.block_encrypt(:aes_ecb, key, encrypted_block) |> :erlang.binary_to_list)
    end
  end
end
