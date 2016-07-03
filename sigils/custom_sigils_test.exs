ExUnit.start

defmodule CustomSigilsTest do
  use ExUnit.Case
  import CustomSigils

  test "~u() sigil converts strings into lower case" do
    assert ~u(HAHA) == "haha"
  end

  test "~U() sigil converts strings into upper case" do
    assert ~U(haha) == "HAHA"
  end
end
