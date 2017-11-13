defmodule Cryptopals.Challenges.C2 do
  alias Cryptopals.Utils.Data

  def solve(x, y), do: Data.xor(x, y)
end
