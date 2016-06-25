# Homework:
# 1. Write a sum function which calculates the total of a list of numbers
# 2. Generalize your sum function so that the user can pass in a function to
# customize what it does (maybe call it reduce)
#
# *Extra Credit* Write your own reverese function

defmodule LinkedList do
  def each([], _fun), do: :ok
  def each([h|t], fun) do
    fun.(h)
    each(t, fun)
  end

  def map(list, fun) do
    do_map(list, fun, [])
  end

  defp do_map([], _fun, acc), do: Enum.reverse(acc)
  defp do_map([h|t], fun, acc) do
    result = fun.(h)
    acc = [result | acc] # add the result to the top of acc list
    do_map(t, fun, acc)
  end

  def length(list) do
    length(list, 0)
  end

  def reverse(list) do
    do_reverse(list, [])
  end

  defp do_reverse([], acc), do: acc
  defp do_reverse([h|t], acc) do
    do_reverse(t, [h|acc])
  end

  @doc """
  Applies a function to all members of a list and summarizes the result

  ## Arguments
  
  - `list` - a linked list (normal elixir list)
  - `fun` - a function, taking sum and current value which will be executed on each element of the list
  - `initial_value` - the initial value to start summarizing from

  ## Examples
      iex> LinkedList.reduce([1,2,3,4], &(&1 + &2), 0)
      10
  """
  def reduce(list, fun, initial_value) do
    do_reduce(list, fun, initial_value)
  end

  defp do_reduce([], _, initial_value), do: initial_value
  defp do_reduce([h|t], fun, acc) do
    acc = fun.(acc, h)
    do_reduce(t, fun, acc)
  end

  def sum(list) do
    do_sum(list, 0)
  end

  defp do_sum([], acc), do: acc
  defp do_sum([h|t], acc) do
    acc = acc + h
    do_sum(t, acc)
  end

  defp length([], count) do
    count
  end

  defp length([_|t], count) do
    length(t, count + 1)
  end
end

# LinkedList.each([1,2,3,4], fn(x) -> IO.puts(x+1); end)

# [1,2,3,4]
# |> LinkedList.map(fn(x) -> x+1; end)
# |> LinkedList.each(fn(x) -> IO.puts(x); end)

IO.puts(LinkedList.sum([1,2,3,4]))

# [1,2,3,4]
# |> LinkedList.length
# |> IO.puts
#
# [1,2,3]
# |> LinkedList.length
# |> IO.puts
#
# []
# |> LinkedList.length
# |> IO.puts
