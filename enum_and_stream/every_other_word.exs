defmodule EveryOtherWord do
  def print_every_other_word(filename) do
    File.stream!(filename)
    |> Stream.filter(&(String.match?(&1, ~r/\w+/))) # remove empty lines
    |> Stream.map(&String.strip/1) # remove trailing new lines
    |> Stream.take_every(2) # interesting experiment: what would happen if I move this up
    |> Enum.into([])
  end
end

EveryOtherWord.print_every_other_word("sample.txt")
|> Enum.each(&IO.puts/1)

