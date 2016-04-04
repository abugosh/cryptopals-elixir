
defmodule Cryptopals.AsciiPlaintextHelpers do
  @printables MapSet.new(0x20..0x7e)
  @text MapSet.new(0x41..0x5a) |> MapSet.union(MapSet.new(0x61..0x7a)) |> MapSet.union(MapSet.new(0x30..0x39))

  def score_byte(char) do
    cond do
      MapSet.member?(@text, char) ->
        4
      MapSet.member?(@printables, char) ->
        3
      true ->
        0
    end
  end

  def score(text) do
    raw = text
          |> Enum.map(&score_byte/1)
          |> Enum.sum
    raw / (Enum.count(text) * 4)
  end
end
