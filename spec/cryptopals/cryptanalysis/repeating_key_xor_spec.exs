defmodule Cryptopals.Cryptanalysis.RepeatingKeyXorSpec do
  use ESpec
  alias Cryptopals.Utils.AsciiPlaintext
  alias Cryptopals.Crypto.XorCipher

  let :ptxt, do: 'YELLOW SUBMARINE'

  context ".score_keys" do
    it "returns a list containing the tuple with the key, score, and the encoded text for one key" do
      described_module().score_keys(ptxt(), [0x00])
      |> expect
      |> to(eq [{0x00, AsciiPlaintext.score(ptxt()), ptxt()}])
    end

    it "returns a list of tuples with the key, score, and the encoded text for a list of keys" do
      encoded_txt = XorCipher.encode(ptxt(), [0xff])

      described_module().score_keys(ptxt(), [0x00, 0xff])
      |> expect
      |> to(eq [{0x00, AsciiPlaintext.score(ptxt()), ptxt()},
                {0xff, AsciiPlaintext.score(encoded_txt), encoded_txt}])
    end
  end

end
