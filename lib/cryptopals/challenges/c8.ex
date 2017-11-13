defmodule Cryptopals.Challenges.C8 do
  alias Cryptopals.Utils.Data

  def solve(ctxt) do
    ctxt
    |> Enum.map(fn x -> {x, x |> Data.count_blocks |> Map.keys |> Enum.count} end)
    |> Enum.max_by(fn {_, v} -> -v end)
    |> elem(0)
  end
end
