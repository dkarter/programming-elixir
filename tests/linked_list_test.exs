ExUnit.start

defmodule LinkedListTest do
  use ExUnit.Case

  doctest LinkedList

  test ".length returns the length a list" do
    assert LinkedList.length([1,2,3,4]) == 4
  end

  test ".sum calculates the total of a list of numbers" do
    assert LinkedList.sum([1,2,3,4]) == 10
  end

  test ".reduce returns initial value when list is empty" do
    assert LinkedList.reduce([], &(&1 + &2), 20) == 20
  end

  test ".reduce returns accumulated value of applied function" do
    assert LinkedList.reduce([1,2,3,4], &*/2, 1) == 24
  end

  test ".reduce returns strings in the correct order" do
    data     = ["episodes", "07-enum-and-stream"]
    expected = "/episodes/07-enum-and-stream"
    fun      = &(&1 <> "/" <> &2)
    assert LinkedList.reduce(data, fun, "") == expected
  end

  test ".reverse returns the list in a reverse order of elements" do
    assert LinkedList.reverse([1,2,3,4]) == [4,3,2,1]
  end

end
