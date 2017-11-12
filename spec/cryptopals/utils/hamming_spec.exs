defmodule Cryptopals.Utils.HammingSpec do
  use ESpec
  let :bin1, do: 'this is a test'
  let :bin2, do: 'wokka wokka!!!'

  subject(Cryptopals.Utils.Hamming)

  context ".distance" do
    it "should have a distance of 0 if the strings are equal" do
      expect(subject().distance('AAAA', 'AAAA')) |> to(eq 0)
    end

    it "should have a distance of byte size if the strings are maximally different" do
      expect(subject().distance([0, 0, 0, 0], [0xff, 0xff, 0xff, 0xff])) |> to(eq 32)
    end

    it "should have a distance of 37 for our test strings" do
      expect(subject().distance(bin1(), bin2())) |> to(eq 37)
    end
  end
end
