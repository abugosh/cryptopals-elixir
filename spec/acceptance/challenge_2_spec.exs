
defmodule Cryptopals.Challenge2Spec do
  use ESpec

  let :bin_1, do: Cryptopals.Convert.hex_to_binary "1c0111001f010100061a024b53535009181c"
  let :bin_2, do: Cryptopals.Convert.hex_to_binary "686974207468652062756c6c277320657965"
  let :sol, do: Cryptopals.Convert.hex_to_binary "746865206b696420646f6e277420706c6179"

  it "should xor the hex inputs to get the solution" do
    expect(Cryptopals.XorHelpers.xor(bin_1, bin_2)) |> to(eq sol)
  end
end
