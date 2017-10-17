
defmodule Cryptopals.Challenge6Spec do
  use ESpec

  let :ctxt, do: Cryptopals.Convert.base64_file_to_binary("spec/acceptance/support/challenge_6.txt")
  let :ptxt, do: File.read!("spec/acceptance/support/challenge_6_plain.txt") |> String.to_charlist

  let :key_size, do: 29
  let :the_key, do: 'Terminator X: Bring the noise'

  def find_key_size(data) do
    max_size = div(Enum.count(data), 50)

    (4..max_size)
    |> Enum.map(fn (size) ->
      {size,
       (((Cryptopals.Hamming.distance(Enum.take(data, size), Enum.slice(data, size, size)) +
       Cryptopals.Hamming.distance(Enum.take(data, size), Enum.slice(data, size * 2, size)) +
       Cryptopals.Hamming.distance(Enum.slice(data, size * 2, size), Enum.slice(data, size * 3, size))) / 3.0) / size)}
    end)
    |> Enum.max_by(fn({_, distance}) -> -distance end)
  end

  def score_cipher_text(txt) do
    (0..255)
    |> Enum.map(fn (key) ->
      encoded_txt = Cryptopals.XorCipher.encode(txt, [key])
      {key, Cryptopals.AsciiPlaintextHelpers.score(encoded_txt), encoded_txt}
    end)
  end

  it "should find the key size" do
    {size, _} = find_key_size(ctxt())
    expect(size) |> to(eq key_size())
  end

  it "should find and decrypt the cipher text in the file" do
    {size, _} = find_key_size(ctxt())

    full_key = (1..size)
    |> Enum.map(fn(x) -> Enum.take_every(Enum.drop(ctxt(), x - 1), size) end)
    |> Enum.map(fn(txt) ->
      {key, _, _} = (txt
                    |> score_cipher_text
                    |> Enum.max_by(fn ({_, score, _}) -> score end))
      key
    end)

    expect(full_key) |> to(eq the_key())
    expect(Cryptopals.XorCipher.encode(ctxt(), full_key)) |> to(eq ptxt())
  end
end
