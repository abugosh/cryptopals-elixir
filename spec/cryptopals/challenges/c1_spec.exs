defmodule Cryptopals.Challenges.C1Spec do
  use ESpec

  let :hex, do: "49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d"
  let :base64, do: "SSdtIGtpbGxpbmcgeW91ciBicmFpbiBsaWtlIGEgcG9pc29ub3VzIG11c2hyb29t"

  it "should convert the hex input to the base64 output" do
    expect(described_module().solve(hex())) |> to(eq base64())
  end
end
