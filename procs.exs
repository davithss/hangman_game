defmodule Procs do
  def greeter(count) do
    receive do
      {:add, n} ->
        greeter(count+n)
      {:reset} ->
        greeter(count = 0)
      msg ->
        IO.puts "#{count}: hello #{inspect msg}"
        greeter(count)
    end
  end
end
