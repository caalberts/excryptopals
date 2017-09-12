defmodule Cryptopals.Hex do
  alias Cryptopals.Bytes

  def to_base64(hex) do
    hex
    |> Bytes.from_hex
    |> Bytes.to_base64
  end

  def bitwise_xor(hex_1, hex_2) do
    [hex_1, hex_2]
    |> Bytes.from_hex
    |> Bytes.xor
    |> Bytes.to_hex
  end

  def single_byte_xor(hex, n) do
    <<n>>
    |> Bytes.to_hex
    |> String.duplicate(div String.length(hex), 2)
    |> bitwise_xor(hex)
    |> Bytes.from_hex
  end

end
