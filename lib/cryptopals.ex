defmodule Cryptopals do
  alias Cryptopals.Bytes

  def hex_to_base64(hex) do
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

end
