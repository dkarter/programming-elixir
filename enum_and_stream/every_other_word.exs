defmodule EveryOtherWord do
  def print_every_other_word(filename) do
    File.stream!(filename)
    |> Stream.filter(&(String.match?(&1, ~r/\w+/)))
    |> Stream.map(&String.strip/1)
    |> Stream.take_every(2)
    |> Enum.into([])
  end
end

EveryOtherWord.print_every_other_word("sample.txt")
|> Enum.each(&IO.puts/1)
