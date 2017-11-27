
defmodule Cryptopals.Crypto.PaddingSpec do
  use ESpec

  context ".pad_block" do
    it "does nothing if the txt matches the block size" do
      'hello'
      |> described_module().pad_block(5)
      |> expect
      |> to(eq 'hello')
    end

    it "pads the text with bytes of the length of the padding" do
      'hello'
      |> described_module().pad_block(6)
      |> expect
      |> to(eq 'hello' ++ [0x01])
    end

    it "adds bytes up to the block size if the txt is smaller" do
      'hello'
      |> described_module().pad_block(10)
      |> expect
      |> to(eq 'hello' ++ [0x05, 0x05, 0x05, 0x05, 0x05])
    end
  end

  context ".pad_text" do
    it "does nothing if the text matches the block size" do
      'hello'
      |> described_module().pad_text(16)
      |> expect
      |> to(eq described_module().pad_block('hello', 16))
    end

    it "does nothing if the text's size is a multiple of the block size" do
      txt = 'hello' |> Stream.cycle |> Enum.take(10)

      txt
      |> described_module().pad_text(5)
      |> expect
      |> to(eq txt)
    end

    it "pads the final block to the size of the block size if it is less than the block size" do
      txt = 'hello' |> Stream.cycle |> Enum.take(14)

      txt
      |> described_module().pad_text(5)
      |> expect
      |> to(eq txt ++ [0x01])
    end
  end
end
