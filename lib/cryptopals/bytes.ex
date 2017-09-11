defmodule Cryptopals.Bytes do
  use Bitwise

  def from_hex(hex) when is_list(hex), do: Enum.map(hex, &from_hex/1)
  def from_hex(hex), do: Base.decode16!(hex, case: :lower)

  def to_base64(bin), do: Base.encode64(bin)

  def to_hex(bin), do: Base.encode16(bin, case: :lower)

  def xor(bins) when is_list(bins) do
    bins
    |> Enum.map(&:binary.bin_to_list/1)
    |> List.zip
    |> Enum.map(fn {a,b} -> a ^^^ b end)
    |> :binary.list_to_bin
  end

end
