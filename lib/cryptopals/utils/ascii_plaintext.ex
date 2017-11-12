defmodule Cryptopals.Utils.AsciiPlaintext do
  @printables MapSet.new(0x20..0x7e)
  @text (0x41..0x5a
         |> MapSet.new
         |> MapSet.union(MapSet.new(0x61..0x7a))
         |> MapSet.union(MapSet.new(0x30..0x39))
         |> MapSet.union(MapSet.new(' !"\',.?@')))

  def score_byte(char) do
    cond do
      MapSet.member?(@text, char) ->
        4
      MapSet.member?(@printables, char) ->
        2
      true ->
        0
    end
  end

  @doc """
  Applies a score to the supplied text to test if it falls in the ASCII range.
  """
  def score(text) do
    raw = text
          |> Enum.map(&score_byte/1)
          |> Enum.sum
    raw / (Enum.count(text) * 4)
  end
end
