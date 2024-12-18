defmodule LanguageList do
  def new(), do: []

  def add(list, language), do: [language | list]

  def remove(list) do
    tl(list)
  end

  def first(list) do
    List.first(list)
  end

  def count(list) do
    length(list)
  end

  def functional_list?(list) do
    "Elixir" in list
  end
end
