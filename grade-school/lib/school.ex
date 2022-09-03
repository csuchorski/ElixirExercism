defmodule School do
  @moduledoc """
  Simulate students in a school.

  Each student is in a grade.
  """

  @type school :: any()

  @doc """
  Create a new, empty school.
  """
  @spec new() :: school
  def new() do
    []
  end

  @doc """
  Add a student to a particular grade in school.
  """
  @spec add(school, String.t(), integer) :: {:ok | :error, school}
  def add([], name, grade) do
    {:ok, [{name, grade}]}
  end

  def add(school, name, grade) do
    if !check_if_student_in_roster?(school, name) do
      {:ok, [{name, grade} | school]}
    else
      {:error, school}
    end
  end

  @doc """
  Return the names of the students in a particular grade, sorted alphabetically.
  """
  @spec grade(school, integer) :: [String.t()]
  def grade(school, grade) do
    group_names_by_grade(school) |> Map.get(grade, []) |> Enum.sort()
  end

  @doc """
  Return the names of all the students in the school sorted by grade and name.
  """
  @spec roster(school) :: [String.t()]
  def roster(school) do
    Enum.reduce(Map.keys(group_names_by_grade(school)), [], fn grade_num, acc ->
      acc ++ grade(school, grade_num)
    end)
  end

  defp check_if_student_in_roster?(school, name) do
    Enum.any?(school, fn {name_from_roster, _grade} -> name_from_roster == name end)
  end

  defp group_names_by_grade(school) do
    Enum.group_by(school, &elem(&1, 1), fn {name, _grade} -> name end)
  end
end
