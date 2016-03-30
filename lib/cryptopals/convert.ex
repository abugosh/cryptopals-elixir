
defmodule Cryptopals.Convert do
  def hex_to_base64(hex) do
    hex
    |> hex_to_binary
    |> binary_to_base64
  end

  def hex_to_binary(hex) do
    hex
    |> Base.decode16!(case: :mixed)
    |> String.to_char_list
  end

  def binary_to_hex(binary) do
    binary
    |> to_string
    |> Base.encode16(case: :lower)
  end

  def binary_to_base64(binary) do
    binary
    |> to_string
    |> Base.encode64
  end
end
