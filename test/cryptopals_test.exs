defmodule CryptopalsTest do
  use ExUnit.Case
  doctest Cryptopals

  test "convert hex to base 64" do
    hex = "49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d"

    assert "SSdtIGtpbGxpbmcgeW91ciBicmFpbiBsaWtlIGEgcG9pc29ub3VzIG11c2hyb29t" = Cryptopals.hex_to_base64(hex)
  end

  test "bitwise XOR" do
    hex_1 = "1c0111001f010100061a024b53535009181c"
    hex_2 = "686974207468652062756c6c277320657965"

    assert "746865206b696420646f6e277420706c6179" = Cryptopals.bitwise_xor(hex_1, hex_2)
  end

  test "decrypt single-byte XOR cypher" do
    cypher = "1b37373331363f78151b7f2b783431333d78397828372d363c78373e783a393b3736"

    assert "Cooking MC's like a pound of bacon" = Cryptopals.decrypt(cypher)
  end

  test "detect single-character XOR" do
    with {:ok, data} <- File.read("fixture/detect-single-char-xor.txt") do
      cyphers = String.split(data)
      assert "Now that the party is jumping\n" == Cryptopals.decrypt(cyphers)
    end
  end

end
