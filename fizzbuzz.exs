defmodule Fizzbuzz do
  # Write a program that prints the numbers from 1 to 100. But for multiples of
  # three print “Fizz” instead of the number and for the multiples of five print
  # “Buzz”. For numbers which are multiples of both three and five print
  # “FizzBuzz”.

  @doc """
  Returns "fizz" for multiples of 3, "buzz" for multiples of 5 and "fizzbuzz"
  for multiples of both 3 and 5. Otherwise it returns the number as a string.

  ## Parameters

  - `value` - an Integer

  ## Examples

      iex> Fizzbuzz.fizzbuzz(45)
      "fizzbuzz"

      iex> a = 3
      ...> Fizzbuzz.fizzbuzz(a)
      "fizz"

      iex> Fizzbuzz.fizzbuzz(5)
      "buzz"

      iex> Fizzbuzz.fizzbuzz(7)
      "7"
  """
  def fizzbuzz(value) do
    cond do
      rem(value, 15) == 0 ->  "fizzbuzz"
      rem(value, 3) == 0 -> "fizz"
      rem(value, 5) == 0 -> "buzz"
      true -> Integer.to_string(value)
    end
  end

  # Solution using guards
  # def fizzbuzz(value) when rem(value, 15) == 0, do: "fizzbuzz"
  # def fizzbuzz(value) when rem(value, 3) == 0, do: "fizz"
  # def fizzbuzz(value) when rem(value, 5) == 0, do: "buzz"
  # def fizzbuzz(value), do: Integer.to_string(value)

  # One liner killer solution that everyone will love to hate
  # split into multiple lines for readability
  # def fizzbuzz_oneliner(val) do
  #   %{
  #     [true,true] => "FizzBuzz", 
  #     [false,true] => "Fizz", 
  #     [true,false] => "Buzz",
  #   }[[rem(val, 3) == 0, rem(val, 5) == 0]] || val
  # end

  def fizzbuzz_range(range) do
    Enum.map(range, fn(v) -> IO.puts(fizzbuzz(v)) ;end)
  end
end


# Fizzbuzz.fizzbuzz_range(1..100)
