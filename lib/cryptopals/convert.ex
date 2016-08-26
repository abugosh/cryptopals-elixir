
defmodule Cryptopals.Convert do
  def hex_to_base64(hex) do
    hex
    |> hex_to_binary
    |> binary_to_base64
  end

  def hex_to_binary(hex) do
    hex
    |> Base.decode16!(case: :mixed)
    |> :erlang.binary_to_list
  end

  def binary_to_hex(binary) do
    binary
    |> :erlang.list_to_binary
    |> Base.encode16(case: :lower)
  end

  def binary_to_base64(binary) do
    binary
    |> :erlang.list_to_binary
    |> Base.encode64
  end

  def base64_file_to_binary(file_name) do
    File.read!(file_name)
    |> String.replace("\n", "")
    |> Base.decode64!
    |> :erlang.binary_to_list
  end
end
