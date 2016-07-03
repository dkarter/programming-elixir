# spawn fn ->
#   IO.puts "this is running on a different process"
# end
#
# defmodule SpawnModule do
#   def say_hi(first_name, last_name) do
#     IO.puts ~s(Another process is saying: "Hi #{first_name} #{last_name}")
#   end
# end
#
# spawn SpawnModule, :say_hi, ["Dorian", "Karter"]

defmodule Pong do
  def start do
    wait(self, 0)
  end

  def wait(pid, count) do
    count = count + 1
    receive do
      {:ping, sender, ping_count} ->
        IO.puts "got ping ##{ping_count}, sending pong ##{count}"
        sleep
        send sender, {:pong, pid, count}
    after 500 ->
      IO.puts "Pong done waiting ... over and out"
    end
    wait(pid, count)
  end

  def sleep do
    1..600
    |> Enum.random
    |> Process.sleep
  end
end

defmodule Ping do
  def start do
    wait(self, 0)
  end

  def wait(pid, count) do
    count = count + 1
    receive do
      {:pong, sender, pong_count} ->
        IO.puts "got pong ##{pong_count}, sending ping ##{count}"
        sleep
        send sender, {:ping, pid, count}
    after 500 ->
      IO.puts "Ping done waiting ... over and out"
    end
    wait(pid, count)
  end

  def sleep do
    1..600
    |> Enum.random
    |> Process.sleep
  end
end

Process.flag(:trap_exit, true)
ping_pid = spawn_link(Ping, :start, [])
pong_pid = spawn_link(Pong, :start, [])
send pong_pid, {:ping, ping_pid, -1}

receive do
  {:EXIT, pid, reason} ->
    IO.inspect pid
    IO.puts "exited #{reason}"
end

receive do
  {:EXIT, pid, reason} ->
    IO.inspect pid
    IO.puts "exited #{reason}"
end
