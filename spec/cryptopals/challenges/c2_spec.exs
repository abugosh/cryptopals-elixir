defmodule Cryptopals.Challenges.C2Spec do
  use ESpec
  alias Cryptopals.Utils.Convert

  let :bin_1, do: Convert.hex_to_binary "1c0111001f010100061a024b53535009181c"
  let :bin_2, do: Convert.hex_to_binary "686974207468652062756c6c277320657965"
  let :sol, do: Convert.hex_to_binary "746865206b696420646f6e277420706c6179"

  it "should xor the hex inputs to get the solution" do
    expect(described_module().solve(bin_1(), bin_2())) |> to(eq sol())
  end
end
