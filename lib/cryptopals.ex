defmodule Cryptopals do

  def hex_to_base64(hex) do
    hex
    |> from_hex
    |> to_base64
  end

  defp from_hex(hex) do
    Base.decode16!(hex, case: :lower)
  end

  defp to_base64(bin) do
    Base.encode64(bin)
  end

end
