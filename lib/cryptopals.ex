defmodule Cryptopals do
  alias Cryptopals.{Bytes, English}

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

  def decrypt(hex) do
    0..255
    |> Enum.map(fn n ->
      <<n>>
      |> Bytes.to_hex
      |> String.duplicate(div String.length(hex), 2)
      |> bitwise_xor(hex)
    end)
    |> Enum.map(&Bytes.from_hex/1)
    |> Enum.filter(&String.valid?/1)
    |> Enum.min_by(&English.chi_squared/1)
  end

end
