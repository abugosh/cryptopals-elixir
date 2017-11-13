defmodule Cryptopals.Challenges.C1 do
  alias Cryptopals.Utils.Convert

  def solve(hex) do
    Convert.hex_to_base64(hex)
  end
end
