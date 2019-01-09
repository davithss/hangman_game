defmodule PatternMatcher do
  #gonna swap the number when entered
  def swap({a,b}), do: {b,a}

  #gonna check if its equal or not without conditional
  def equal(a, a), do: true
  def equal(_, _), do: false
end
