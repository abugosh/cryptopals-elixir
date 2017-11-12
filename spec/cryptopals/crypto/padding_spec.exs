
defmodule Cryptopals.Crypto.PaddingSpec do
  use ESpec

  subject(Cryptopals.Crypto.Padding)

  context ".pad_block" do
    it "should do nothing if the txt matches the block size" do
      expect(subject().pad_block('hello', 5)) |> to(eq 'hello')
    end

    it "should add bytes up to the block size if the txt is smaller" do
      expect(subject().pad_block('hello', 10)) |> to(eq 'hello' ++ [4, 4, 4, 4, 4])
    end

    it "should allow you to specify the padding byte" do
      expect(subject().pad_block('hello', 10, 0xff)) |> to(eq 'hello' ++ [0xff, 0xff, 0xff, 0xff, 0xff])
    end
  end
end
