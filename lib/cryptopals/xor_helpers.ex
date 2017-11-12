
defmodule Cryptopals.XorHelpers do
  use Bitwise

  def xor(x, y) do
    x
    |> Enum.zip(y)
    |> Enum.map(fn {a, b} -> a ^^^ b end)
  end
end
