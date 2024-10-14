defmodule Username do
  def sanitize([]), do: []

  def sanitize([head | tail]) do
    case head do
      head when head >= 97 and head <= 122 -> [head | sanitize(tail)]
      ?_ -> [?_ | sanitize(tail)]
      ?ä -> [?a, ?e | sanitize(tail)]
      ?ö -> [?o, ?e | sanitize(tail)]
      ?ü -> [?u, ?e | sanitize(tail)]
      ?ß -> [?s, ?s | sanitize(tail)]
      _ -> sanitize(tail)
    end
  end
end
