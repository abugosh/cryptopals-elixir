
defmodule Cryptopals.XorHelpersSpec do
  use ESpec
  import Cryptopals.Convert

  let :hex_1, do: "1c0111001f010100061a024b53535009181c"
  let :hex_2, do: "686974207468652062756c6c277320657965"
  let :sol, do: "746865206b696420646f6e277420706c6179"

  subject(Cryptopals.XorHelpers)

  context ".xor" do
    it "should xor the binarys" do
      expect(subject().xor(hex_to_binary(hex_1()), hex_to_binary(hex_2()))) |> to(eq hex_to_binary(sol()))
    end
  end
end
