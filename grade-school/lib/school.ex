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
    %{}
  end

  @doc """
  Add a student to a particular grade in school.
  """
  @spec add(school, String.t(), integer) :: {:ok | :error, school}
  def add(school, name, grade) do
    if !check_if_student_in_roster?(school, name) do
      {:ok, Map.update(school, grade, [name], fn names -> [name | names] end)}
    else
      {:error, school}
    end
  end

  @doc """
  Return the names of the students in a particular grade, sorted alphabetically.
  """
  @spec grade(school, integer) :: [String.t()]
  def grade(school, grade) do
    school |> Map.get(grade, []) |> Enum.sort()
  end

  @doc """
  Return the names of all the students in the school sorted by grade and name.
  """
  @spec roster(school) :: [String.t()]
  def roster(school) do
    Enum.reduce(Map.keys(school), [], fn grade_num, acc ->
      acc ++ grade(school, grade_num)
    end)
  end

  defp check_if_student_in_roster?(school, name) do
    Enum.any?(
      Map.values(school) |> List.flatten(),
      fn name_in_roster -> name == name_in_roster end
    )
  end
end
