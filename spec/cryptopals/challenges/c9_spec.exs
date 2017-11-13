defmodule Cryptopals.Challenges.C9Spec do
  use ESpec

  let :txt_to_pad, do: 'YELLOW SUBMARINE'
  let :padded_txt, do: 'YELLOW SUBMARINE' ++ [4, 4, 4, 4]

  it "pads the txt to 20 bytes" do
    expect(described_module().solve(txt_to_pad(), 20)) |> to(eq padded_txt())
  end
end
