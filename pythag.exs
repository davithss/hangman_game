for a <- 1..100, b <- 1..100, c <- 1..100, a*a + b*b == c*c, do: [a, b, c]


# We can use Erlang's `timer` library to see how long this takes:

:timer.tc(fn ->
  for a <- 1..100, b <- 1..100, c <- 1..100, a*a + b*b == c*c, do: [a, b, c]
end) |> IO.inspect

   ##>
   # {89433,
   #  [
   #    [3, 4, 5], [4, 3, 5], [5, 12, 13], [6, 8, 10], [7, 24, 25], ...

# The 89433 is the time in microseconds, so we're taking about 90mS.

# The test `a*a + b*b == c*c` runs 100*100*100, or a million times.
# But we know that a < b < c, so

:timer.tc(fn ->
  for a <- 1..100,
      b <- (a+1)..100,
      c <- (b+1)..100,
      a*a + b*b == c*c,
  do: [a, b, c]
end) |> IO.inspect
