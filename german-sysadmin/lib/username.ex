defmodule Username do
  def sanitize([]), do: []

  def sanitize([head | tail]) do
    cond do
      head >= 97 and head <= 122 -> [head | sanitize(tail)]
      head == ?_ -> [head | sanitize(tail)]
      head == ?ä -> [?a, ?e | sanitize(tail)]
      head == ?ö -> [?o, ?e | sanitize(tail)]
      head == ?ü -> [?u, ?e | sanitize(tail)]
      head == ?ß -> [?s, ?s | sanitize(tail)]
      true -> sanitize(tail)
    end
  end
end
