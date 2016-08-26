
defmodule Cryptopals.ConvertSpec do
  use ESpec

  let :hex, do: "49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d"
  let :binary, do: 'I\'m killing your brain like a poisonous mushroom'
  let :base64, do: "SSdtIGtpbGxpbmcgeW91ciBicmFpbiBsaWtlIGEgcG9pc29ub3VzIG11c2hyb29t"

  subject(Cryptopals.Convert)

  context ".hex_to_base64" do
    it "should convert the test string" do
      expect(subject.hex_to_base64(hex)) |> to(eq base64)
    end
  end

  context ".hex_to_binary" do
    it "should convert the test string" do
      expect(subject.hex_to_binary(hex)) |> to(eq binary)
    end
  end

  context ".binary_to_base64" do
    it "should convert the test string" do
      expect(subject.binary_to_base64(binary)) |> to(eq base64)
    end
  end

  context ".binary_to_hex" do
    it "should convert the test string" do
      expect(subject.binary_to_hex(binary)) |> to(eq hex)
    end
  end

  context ".base64_file_to_binary" do
    it "should read in the file and convert it to binary" do
      expect(subject.base64_file_to_binary("spec/cryptopals/support/base64.txt")) |> to(eq 'Hello world, cryptopals')
    end

    it "should read in the file and cope with new lines well" do
      expect(subject.base64_file_to_binary("spec/cryptopals/support/base64_newlines.txt")) |> to(eq 'Hello world, cryptopals, now with more new lines')
    end
  end
end
