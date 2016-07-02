defmodule CustomSigils do
  def sigil_u(str, _opts) do
    String.downcase(str)
  end

  def sigil_U(str, _opts) do
    String.upcase(str)
  end
end
