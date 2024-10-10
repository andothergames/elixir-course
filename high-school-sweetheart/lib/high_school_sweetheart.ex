defmodule HighSchoolSweetheart do
  def first_letter(name) do
    name
    |> String.trim()
    |> String.first()
  end

  def initial(name) do
    first_letter(name)
    |> String.upcase()
    |> Kernel.<>(".")
  end

  def initials(full_name) do
    [first_name, last_name] =
      String.split(full_name, " ")

    initial(first_name) <> " " <> initial(last_name)
  end

  def pair(full_name1, full_name2) do
    person_one = initials(full_name1)
    person_two = initials(full_name2)

    "     ******       ******\n" <>
      "   **      **   **      **\n" <>
      " **         ** **         **\n" <>
      "**            *            **\n" <>
      "**                         **\n" <>
      "**     #{person_one}  +  #{person_two}     **\n" <>
      " **                       **\n" <>
      "   **                   **\n" <>
      "     **               **\n" <>
      "       **           **\n" <>
      "         **       **\n" <>
      "           **   **\n" <>
      "             ***\n" <>
      "              *\n"

    # Please implement the pair/2 function
  end
end
