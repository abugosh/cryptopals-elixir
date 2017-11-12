defmodule Cryptopals.Utils.Convert do
  @doc """
  Converts a supplied hex string to a base64 string.
  """
  def hex_to_base64(hex) do
    hex
    |> hex_to_binary
    |> binary_to_base64
  end

  @doc """
  Converts a supplied hex string to a binary list.
  """
  def hex_to_binary(hex) do
    hex
    |> Base.decode16!(case: :mixed)
    |> :erlang.binary_to_list
  end

  @doc """
  Converts a supplied binary list to a hex string.
  """
  def binary_to_hex(binary) do
    binary
    |> :erlang.list_to_binary
    |> Base.encode16(case: :lower)
  end

  @doc """
  Converts a supplied binary list to a base64 string.
  """
  def binary_to_base64(binary) do
    binary
    |> :erlang.list_to_binary
    |> Base.encode64
  end

  @doc """
  Retrieves the provided file and converts it from base64 string to binary list.
  """
  def base64_file_to_binary(file_name) do
    file_name
    |> File.read!
    |> String.replace("\n", "")
    |> Base.decode64!
    |> :erlang.binary_to_list
  end
end
