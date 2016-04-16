
defmodule Cryptopals.XorCipherSpec do
  use ESpec

  subject(Cryptopals.XorCipher)

  context ".encode" do
    it "should xor equal length key and cipher text" do
      expect(subject.encode([0,0,0,0], 'AAAA')) |> to(eq 'AAAA')
    end

    it "should repeat the key if it is shorter than the cipher text" do
      expect(subject.encode([0,0,0,0], 'AA')) |> to(eq 'AAAA')
    end

    it "should partially use the key if the key is not a factor of the cipher text" do
      expect(subject.encode([0,0,0,0,0], 'AB')) |> to(eq 'ABABA')
    end
  end

end
