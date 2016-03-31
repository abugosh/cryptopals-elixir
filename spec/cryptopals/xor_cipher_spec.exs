
defmodule Cryptopals.XorCipherSpec do
  use ESpec

  let :ciphered_hex, do: "1b37373331363f78151b7f2b783431333d78397828372d363c78373e783a393b3736"
  let :sol_hex, do: ""

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
