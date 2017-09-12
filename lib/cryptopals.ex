defmodule Cryptopals do
  alias Cryptopals.{Hex, English}

  def hex_to_base64(hex) do
    Hex.to_base64(hex)
  end

  def bitwise_xor(hex_1, hex_2) do
    Hex.bitwise_xor(hex_1, hex_2)
  end

  def decrypt(cyphers) when is_list(cyphers) do
    strings = for c <- cyphers, n <- 0..255, do: Hex.single_byte_xor(c, n)
    English.valid_phrases(strings)
  end

  def decrypt(cypher) do
    strings = for n <- 0..255, do: Hex.single_byte_xor(cypher, n)
    English.valid_phrases(strings)
  end

end
