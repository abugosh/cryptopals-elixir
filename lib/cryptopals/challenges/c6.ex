defmodule Cryptopals.Challenges.C6 do
  alias Cryptopals.Cryptanalysis.RepeatingKeyXor
  alias Cryptopals.Utils.Hamming

  def solve(ctxt) do
    size = find_key_size(ctxt)

    (1..size)
    |> Enum.map(fn(x) ->
      ctxt
      |> Enum.drop(x - 1)
      |> Enum.take_every(size)
    end)
    |> Enum.map(fn(txt) ->
      txt
      |> RepeatingKeyXor.score_keys(0..255)
      |> Enum.max_by(fn ({_, score, _}) -> score end)
      |> elem(0)
    end)
  end

  def find_key_size(data) do
    max_size = div(Enum.count(data), 50)

    (4..max_size)
    |> Enum.map(fn (size) ->
      {size,
       (((Hamming.distance(Enum.take(data, size), Enum.slice(data, size, size)) +
       Hamming.distance(Enum.take(data, size), Enum.slice(data, size * 2, size)) +
       Hamming.distance(Enum.slice(data, size * 2, size), Enum.slice(data, size * 3, size))) / 3.0) / size)}
    end)
    |> Enum.max_by(fn({_, distance}) -> -distance end)
    |> elem(0)
  end
end
