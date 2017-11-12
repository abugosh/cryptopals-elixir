defmodule Cryptopals.Utils.Hamming do
  use Bitwise

  alias Cryptopals.Utils.Data

  @doc """
  Determines the hamming distance between the two provided lists
  """
  def distance(bin1, bin2) when bin1 == bin2 do
    0
  end

  def distance(bin1, bin2) do
    bin1
    |> Data.xor(bin2)
    |> Enum.map(&sum_byte_bits/1)
    |> Enum.sum
  end

  defp sum_byte_bits(byte) do
    [1, 2, 4, 8, 16, 32, 64, 128]
    |> Enum.map(&(bits_up?(byte, &1)))
    |> Enum.count(&(&1))
  end

  defp bits_up?(byte, val) do
    (byte &&& val) > 0
  end
end
