defmodule Cryptopals do
  use Bitwise

  def hex_to_base64(hex) do
    hex
    |> from_hex
    |> to_base64
  end

  def bitwise_xor(hex_1, hex_2) do
    [hex_1, hex_2]
    |> Enum.map(&from_hex/1)
    |> Enum.map(&:binary.bin_to_list/1)
    |> List.zip
    |> Enum.map(fn {a,b} -> a ^^^ b end)
    |> :binary.list_to_bin
    |> to_hex
  end

  defp from_hex(hex) do
    Base.decode16!(hex, case: :lower)
  end

  defp to_base64(bin) do
    Base.encode64(bin)
  end

  defp to_hex(bin) do
    Base.encode16(bin, case: :lower)
  end


end
