
defmodule Cryptopals.XorHelpers do
  use Bitwise

  def xor(x, y) do
    Enum.zip(x, y)
    |> Enum.map(fn {a, b} -> a ^^^ b end)
  end
end
