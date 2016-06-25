defmodule PrintsThings do
  import IO, only: [puts: 1]

  def println(str) do
    puts str
  end
end

PrintsThings.println("Success!!!")
