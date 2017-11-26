
defmodule Cryptopals.Crypto.PaddingSpec do
  use ESpec

  context ".pad_block" do
    it "does nothing if the txt matches the block size" do
      expect(described_module().pad_block('hello', 5)) |> to(eq 'hello')
    end

    it "pads the text with bytes of the length of the padding" do
      expect(described_module().pad_block('hello', 6)) |> to(eq 'hello' ++ [0x01])
    end

    it "adds bytes up to the block size if the txt is smaller" do
      expect(described_module().pad_block('hello', 10)) |> to(eq 'hello' ++ [0x05, 0x05, 0x05, 0x05, 0x05])
    end
  end
end
