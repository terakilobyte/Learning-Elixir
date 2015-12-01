defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
  
  end
end
if System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("example.exs")
else
  Code.load_file("anagram.exs")
end

ExUnit.start
ExUnit.configure exclude: :pending

defmodule AnagramTest do
  use ExUnit.Case

  # @tag :pending
  test "no matches" do
    matches = Anagram.match "diaper", ["hello", "world", "zombies", "pants"]
    assert matches == []
  end

  @tag :pending
  test "detect simple anagram" do
    matches = Anagram.match "ant", ["tan", "stand", "at"]
    assert matches == ["tan"]
  end

  @tag :pending
  test "detect multiple anagrams" do
    matches = Anagram.match "master", ["stream", "pigeon", "maters"]
    assert matches == ["stream", "maters"]
  end

  @tag :pending
  test "do not detect anagram subsets" do
    matches = Anagram.match "good", ~w(dog goody)
    assert matches == []
  end

  @tag :pending
  test "detect anagram" do
    matches = Anagram.match "listen", ~w(enlists google inlets banana)
    assert matches == ["inlets"]
  end

  @tag :pending
  test "multiple anagrams" do
    matches = Anagram.match "allergy", ~w(gallery ballerina regally clergy largely leading)
    assert matches == ["gallery", "regally", "largely"]
  end

  @tag :pending
  test "anagrams must use all letters exactly once" do
    matches = Anagram.match "patter", ["tapper"]
    assert matches == []
  end

  @tag :pending
  test "detect anagrams with case-insensitive subject" do
    matches = Anagram.match "Orchestra", ~w(cashregister carthorse radishes)
    assert matches == ["carthorse"]
  end

  @tag :pending
  test "detect anagrams with case-insensitive candidate" do
    matches = Anagram.match "orchestra", ~w(cashregister Carthorse radishes)
    assert matches == ["Carthorse"]
  end

  @tag :pending
  test "anagrams must not be the source word" do
    matches = Anagram.match "corn", ["corn", "dark", "Corn", "rank", "CORN", "cron", "park"]
    assert matches == ["cron"]
  end

  @tag :pending
  test "do not detect words based on checksum" do
    matches = Anagram.match "mass", ["last"]
    assert matches == []
  end
end
# Anagram

Write a program that, given a word and a list of possible anagrams, selects the correct sublist.

Given `"listen"` and a list of candidates like `"enlists" "google"
"inlets" "banana"` the program should return a list containing
`"inlets"`.

## Running tests

```bash
$ elixir bob_test.exs
```

(Replace `bob_test.exs` with the name of the test file.)

## Source

Inspired by the Extreme Startup game [view source](https://github.com/rchatley/extreme_startup)
defmodule Teenager do
  def hey(input) do
    input = String.replace(input, ~r/[0-9]/, "", global: true)
    input = String.strip(input || "")

    cond do
      flimflam?(input) ->
        "Fine. Be that way!"

      question?(input) ->
        "Sure."

      forceful?(input) ->
        "Whoa, chill out!"

      true ->
        "Whatever."
    end
  end

  defp flimflam?(input) do
    input == ""
  end

  defp question?(input) do
    String.ends_with?(input, "?")
  end

  defp forceful?(input) do
    "" != String.strip(String.replace(input, ~r/,/, "", global: true)) 
    && input == String.upcase(input)
  end
end
if System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("example.exs")
else
  Code.load_file("bob.exs")
end

ExUnit.start
ExUnit.configure(exclude: :pending)

defmodule TeenagerTest do
  use ExUnit.Case, async: true

  test "stating something" do
    assert Teenager.hey("Tom-ay-to, tom-aaaah-to.") == "Whatever."
  end

  # @tag :pending
  test "shouting" do
    assert Teenager.hey("WATCH OUT!") == "Whoa, chill out!"
  end

  # @tag :pending
  test "asking a question" do
    assert Teenager.hey("Does this cryogenic chamber make me look fat?") == "Sure."
  end

  # @tag :pending
  test "talking forcefully" do
    assert Teenager.hey("Let's go make out behind the gym!") == "Whatever."
  end

  # @tag :pending
  test "talking in capitals" do
    assert Teenager.hey("This Isn't Shouting!") == "Whatever."
  end

  # @tag :pending
  test "shouting numbers" do
    assert Teenager.hey("1, 2, 3 GO!") == "Whoa, chill out!"
  end

  # @tag :pending
  test "shouting with special characters" do
    assert Teenager.hey("ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!") == "Whoa, chill out!"
  end

  # @tag :pending
  test "shouting with no exclamation mark" do
    assert Teenager.hey("I HATE YOU") == "Whoa, chill out!"
  end

  # @tag :pending
  test "statement containing question mark" do
    assert Teenager.hey("Ending with ? means a question.") == "Whatever."
  end

  # @tag :pending
  test "silence" do
    assert Teenager.hey("") == "Fine. Be that way!"
  end

  # @tag :pending
  test "prolonged silence" do
    assert Teenager.hey("  ") == "Fine. Be that way!"
  end

  # @tag :pending
  test "only numbers" do
    assert Teenager.hey("1, 2, 3") == "Whatever."
  end

  # @tag :pending
  test "question with numbers" do
    assert Teenager.hey("4?") == "Sure."
  end

  # @tag :pending
  test "shouting in Russian" do
    # Hopefully this is Russian for "GET OUT"
    assert Teenager.hey("УХОДИТЬ") == "Whoa, chill out!"
  end
end
# Bob

Bob is a lackadaisical teenager. In conversation, his responses are very limited.

Bob answers 'Sure.' if you ask him a question.

He answers 'Whoa, chill out!' if you yell at him.

He says 'Fine. Be that way!' if you address him without actually saying
anything.

He answers 'Whatever.' to anything else.

## Instructions

Run the test file, and fix each of the errors in turn. When you get the
first test to pass, go to the first pending or skipped test, and make
that pass as well. When all of the tests are passing, feel free to
submit.

Remember that passing code is just the first step. The goal is to work
towards a solution that is as readable and expressive as you can make
it.

Please make your solution as general as possible. Good code doesn't just
pass the test suite, it works with any input that fits the
specification.

Have fun!


## Running tests

```bash
$ elixir bob_test.exs
```

(Replace `bob_test.exs` with the name of the test file.)

## Source

Inspired by the 'Deaf Grandma' exercise in Chris Pine's Learn to Program tutorial. [view source](http://pine.fm/LearnToProgram/?Chapter=06)
defmodule ETL do
  @doc """
  Transform an index into an inverted index.

  ## Examples

  iex> ETL.transform(%{"a" => ["ABILITY", "AARDVARK"], "b" => ["BALLAST", "BEAUTY"]})
  %{"ability" => "a", "aardvark" => "a", "ballast" => "b", "beauty" =>"b"}
  """
  @spec transform(Dict.t) :: map()
  def transform(input) do

  end
end
if System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("example.exs")
else
  Code.load_file("etl.exs")
end

ExUnit.start
ExUnit.configure exclude: :pending

defmodule TransformTest do
  use ExUnit.Case, async: true

  # @tag :pending
  test "transform one value" do
    old = %{1 => ["WORLD"]}
    expected = %{"world" => 1}

    assert ETL.transform(old) == expected
  end

  @tag :pending
  test "transform more values" do
    old = %{1 => ["WORLD", "GSCHOOLERS"]}
    expected = %{"world" => 1, "gschoolers" => 1}

    assert ETL.transform(old) == expected
  end

  @tag :pending
  test "more keys" do
    old = %{1 => ["APPLE", "ARTICHOKE"], 2 => ["BOAT", "BALLERINA"]}
    expected = %{
      "apple" => 1,
      "artichoke" => 1,
      "boat" => 2,
      "ballerina" => 2
    }

    assert ETL.transform(old) == expected
  end

  @tag :pending
  test "full dataset" do
    old = %{
      1 =>  ~W(A E I O U L N R S T),
      2 =>  ~W(D G),
      3 =>  ~W(B C M P),
      4 =>  ~W(F H V W Y),
      5 =>  ~W(K),
      8 =>  ~W(J X),
      10 => ~W(Q Z)
    }

    expected = %{
      "a" => 1, "b" => 3,  "c" => 3, "d" => 2, "e" => 1,
      "f" => 4, "g" => 2,  "h" => 4, "i" => 1, "j" => 8,
      "k" => 5, "l" => 1,  "m" => 3, "n" => 1, "o" => 1,
      "p" => 3, "q" => 10, "r" => 1, "s" => 1, "t" => 1,
      "u" => 1, "v" => 4,  "w" => 4, "x" => 8, "y" => 4,
      "z" => 10
    }

    assert ETL.transform(old) == expected
  end
end
# Etl

We are going to do the `Transform` step of an Extract-Transform-Load.

### ETL
Extract-Transform-Load (ETL) is a fancy way of saying, "We have some crufty, legacy data over in this system, and now we need it in this shiny new system over here, so
we're going to migrate this."

(Typically, this is followed by, "We're only going to need to run this
once." That's then typically followed by much forehead slapping and
moaning about how stupid we could possibly be.)

### The goal
We're going to extract some scrabble scores from a legacy system.

The old system stored a list of letters per score:

- 1 point: "A", "E", "I", "O", "U", "L", "N", "R", "S", "T",
- 2 points: "D", "G",
- 3 points: "B", "C", "M", "P",
- 4 points: "F", "H", "V", "W", "Y",
- 5 points: "K",
- 8 points: "J", "X",
- 10 points: "Q", "Z",

The shiny new scrabble system instead stores the score per letter, which
makes it much faster and easier to calculate the score for a word. It
also stores the letters in lower-case regardless of the case of the
input letters:

- "a" is worth 1 point.
- "b" is worth 3 points.
- "c" is worth 3 points.
- "d" is worth 2 points.
- Etc.

Your mission, should you choose to accept it, is to write a program that
transforms the legacy data format to the shiny new format.

### Notes
Note that both the old and the new system use strings to represent
letters, even in languages that have a separate data type for
characters.

A final note about scoring, Scrabble is played around the world in a
variety of languages, each with its own unique scoring table. For
example, an "A" is scored at 14 in the Basque-language version of the
game while being scored at 9 in the Latin-language version.

## Running tests

```bash
$ elixir bob_test.exs
```

(Replace `bob_test.exs` with the name of the test file.)

## Source

The Jumpstart Lab team [view source](http://jumpstartlab.com)
if System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("example.exs")
else
  Code.load_file("school.exs")
end

ExUnit.start
ExUnit.configure(exclude: :pending)

defmodule SchoolTest do
  use ExUnit.Case, async: true

  def db, do: %{}

  test "add student" do
    actual = School.add(db, "Aimee", 2)
    assert actual == %{2 => ["Aimee"]}
  end

  @tag :pending
  test "add more students in same class" do
    actual = db
     |> School.add("James", 2)
     |> School.add("Blair", 2)
     |> School.add("Paul", 2)

    assert Enum.sort(actual[2]) == ["Blair", "James", "Paul"]
  end

  @tag :pending
  test "add students to different grades" do
    actual = db
     |> School.add("Chelsea", 3)
     |> School.add("Logan", 7)

    assert actual == %{3 => ["Chelsea"], 7 => ["Logan"]}
  end

  @tag :pending
  test "get students in a grade" do
    actual = db
     |> School.add("Bradley", 5)
     |> School.add("Franklin", 5)
     |> School.add("Jeff", 1)
     |> School.grade(5)

    assert Enum.sort(actual) == ["Bradley", "Franklin"]
  end

  @tag :pending
  test "get students in a non existant grade" do
    assert [] == School.grade(db, 1)
  end

  @tag :pending
  test "sort school by grade and by student name" do
    actual = db
     |> School.add("Bart", 4)
     |> School.add("Jennifer", 4)
     |> School.add("Christopher", 4)
     |> School.add("Kareem", 6)
     |> School.add("Kyle", 3)
     |> School.sort

    expected = %{
     3 => ["Kyle"],
     4 => ["Bart", "Christopher", "Jennifer"],
     6 => ["Kareem"]
    }

    assert expected == actual
  end

end
A pairing session with Phil Battos at gSchool [view source](http://gschool.it)
defmodule School do
  @moduledoc """
  Simulate students in a school.

  Each student is in a grade.
  """

  @doc """
  Add a student to a particular grade in school.
  """
  @spec add(Dict.t, String.t, pos_integer) :: Dict.t
  def add(db, name, grade) do

  end

  @doc """
  Return the names of the students in a particular grade.
  """
  @spec grade(Dict.t, pos_integer) :: [String]
  def grade(db, grade) do

  end

  @doc """
  Sorts the school by grade and name.
  """
  @spec sort(Dict) :: Dict.t
  def sort(db) do

  end
end
defmodule Year do
  @doc """
  Returns whether 'year' is a leap year.

  A leap year occurs:

  on every year that is evenly divisible by 4
    except every year that is evenly divisible by 100
      except every year that is evenly divisible by 400.
  """
  @spec leap_year?(non_neg_integer) :: boolean
  def leap_year?(year) do
    cond do
      rem(year, 400) == 0 -> true
      rem(year, 100) == 0 -> false
      rem(year, 4) == 0 -> true
      true -> false
    end
  end
end
if System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("example.exs")
else
  Code.load_file("leap.exs")
end

ExUnit.start
ExUnit.configure exclude: :pending

defmodule LeapTest do
  use ExUnit.Case, async: true

  # @tag :pending
  test "vanilla leap year" do
    assert Year.leap_year?(1996)
  end

  # @tag :pending
  test "any old year" do
    refute Year.leap_year?(1997), "1997 is not a leap year."
  end

  # @tag :pending
  test "century" do
    refute Year.leap_year?(1900), "1900 is not a leap year."
  end

  # @tag :pending
  test "exceptional century" do
    assert Year.leap_year?(2400)
  end
end

defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count(l) do

  end

  @spec reverse(list) :: list
  def reverse(l) do

  end

  @spec map(list, (any -> any)) :: list
  def map(l, f) do

  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f) do

  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce(l, acc, f) do

  end

  @spec append(list, list) :: list
  def append(a, b) do

  end

  @spec concat([[any]]) :: [any]
  def concat(ll) do

  end
end
if System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("example.exs")
else
  Code.load_file("list_ops.exs")
end

ExUnit.start
ExUnit.configure exclude: :pending

defmodule ListOpsTest do
  alias ListOps, as: L

  use ExUnit.Case, async: true

  defp odd?(n), do: rem(n, 2) == 1

  # @tag :pending
  test "count of empty list" do
    assert L.count([]) == 0
  end

  @tag :pending
  test "count of normal list" do
    assert L.count([1,3,5,7]) == 4
  end

  @tag :pending
  test "count of huge list" do
    assert L.count(Enum.to_list(1..1_000_000)) == 1_000_000
  end

  @tag :pending
  test "reverse of empty list" do
    assert L.reverse([]) == []
  end

  @tag :pending
  test "reverse of normal list" do
    assert L.reverse([1,3,5,7]) == [7,5,3,1]
  end

  @tag :pending
  test "reverse of huge list" do
    assert L.reverse(Enum.to_list(1..1_000_000)) == Enum.to_list(1_000_000..1)
  end

  @tag :pending
  test "map of empty list" do
    assert L.map([], &(&1+1)) == []
  end

  @tag :pending
  test "map of normal list" do
    assert L.map([1,3,5,7], &(&1+1)) == [2,4,6,8]
  end

  @tag :pending
  test "map of huge list" do
    assert L.map(Enum.to_list(1..1_000_000), &(&1+1)) ==
      Enum.to_list(2..1_000_001)
  end

  @tag :pending
  test "filter of empty list" do
    assert L.filter([], &odd?/1) == []
  end

  @tag :pending
  test "filter of normal list" do
    assert L.filter([1,2,3,4], &odd?/1) == [1,3]
  end

  @tag :pending
  test "filter of huge list" do
    assert L.filter(Enum.to_list(1..1_000_000), &odd?/1) ==
      Enum.map(1..500_000, &(&1*2-1))
  end

  @tag :pending
  test "reduce of empty list" do
    assert L.reduce([], 0, &(&1+&2)) == 0
  end

  @tag :pending
  test "reduce of normal list" do
    assert L.reduce([1,2,3,4], -3, &(&1+&2)) == 7
  end

  @tag :pending
  test "reduce of huge list" do
    assert L.reduce(Enum.to_list(1..1_000_000), 0, &(&1+&2)) ==
      Enum.reduce(1..1_000_000, 0, &(&1+&2))
  end

  @tag :pending
  test "reduce with non-commutative function" do
    assert L.reduce([1,2,3,4], 10, fn x, acc -> acc - x end) == 0
  end

  @tag :pending
  test "append of empty lists" do
    assert L.append([], []) == []
  end

  @tag :pending
  test "append of empty and non-empty list" do
    assert L.append([], [1,2,3,4]) == [1,2,3,4]
  end

  @tag :pending
  test "append of non-empty and empty list" do
    assert L.append([1,2,3,4], []) == [1,2,3,4]
  end

  @tag :pending
  test "append of non-empty lists" do
    assert L.append([1,2,3], [4,5]) == [1,2,3,4,5]
  end

  @tag :pending
  test "append of huge lists" do
    assert L.append(Enum.to_list(1..1_000_000), Enum.to_list(1_000_001..2_000_000)) ==
      Enum.to_list(1..2_000_000)
  end

  @tag :pending
  test "concat of empty list of lists" do
    assert L.concat([]) == []
  end

  @tag :pending
  test "concat of normal list of lists" do
    assert L.concat([[1,2],[3],[],[4,5,6]]) == [1,2,3,4,5,6]
  end

  @tag :pending
  test "concat of huge list of small lists" do
    assert L.concat(Enum.map(1..1_000_000, &[&1])) ==
      Enum.to_list(1..1_000_000)
  end

  @tag :pending
  test "concat of small list of huge lists" do
    assert L.concat(Enum.map(0..9, &Enum.to_list((&1*100_000+1)..((&1+1)*100_000)))) ==
      Enum.to_list(1..1_000_000)
  end
end
# List Ops

Implement basic list operations

In functional languages list operations like `length`, `map`, and
`reduce` are very common. Implement a series of basic list operations,
without using existing functions.

## Running tests

```bash
$ elixir bob_test.exs
```

(Replace `bob_test.exs` with the name of the test file.)

## Source

 [view source]()
defmodule Meetup do
  @moduledoc """
  Calculate meetup dates.
  """

  @type weekday ::
      :monday | :tuesday | :wednesday
    | :thursday | :friday | :saturday | :sunday

  @type schedule :: :first | :second | :third | :fourth | :last | :teenth

  @doc """
  Calculate a meetup date.

  The schedule is in which week (1..4, last or "teenth") the meetup date should
  fall.
  """
  @spec meetup(pos_integer, pos_integer, weekday, schedule) :: :calendar.date
  def meetup(year, month, weekday, schedule) do

  end
end
if System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("example.exs")
else
  Code.load_file("meetup.exs")
end

ExUnit.start
ExUnit.configure exclude: :pending

defmodule MeetupTest do
  use ExUnit.Case, async: false

  # @tag :pending
  test "monteenth of may 2013" do
    assert Meetup.meetup(2013, 5, :monday, :teenth) == {2013, 5, 13}
  end

  @tag :pending
  test "monteenth of august 2013" do
    assert Meetup.meetup(2013, 8, :monday, :teenth) == {2013, 8, 19}
  end

  @tag :pending
  test "monteenth of september 2013" do
    assert Meetup.meetup(2013, 9, :monday, :teenth) == {2013, 9, 16}
  end

  @tag :pending
  test "tuesteenth of march 2013" do
    assert Meetup.meetup(2013, 3, :tuesday, :teenth) == {2013, 3, 19}
  end

  @tag :pending
  test "tuesteenth of april 2013" do
    assert Meetup.meetup(2013, 4, :tuesday, :teenth) == {2013, 4, 16}
  end

  @tag :pending
  test "tuesteenth of august 2013" do
    assert Meetup.meetup(2013, 8, :tuesday, :teenth) == {2013, 8, 13}
  end

  @tag :pending
  test "wednesteenth of january 2013" do
    assert Meetup.meetup(2013, 1, :wednesday, :teenth) == {2013, 1, 16}
  end

  @tag :pending
  test "wednesteenth of february 2013" do
    assert Meetup.meetup(2013, 2, :wednesday, :teenth) == {2013, 2, 13}
  end

  @tag :pending
  test "wednesteenth of june 2013" do
    assert Meetup.meetup(2013, 6, :wednesday, :teenth) == {2013, 6, 19}
  end

  @tag :pending
  test "thursteenth of may 2013" do
    assert Meetup.meetup(2013, 5, :thursday, :teenth) == {2013, 5, 16}
  end

  @tag :pending
  test "thursteenth of june 2013" do
    assert Meetup.meetup(2013, 6, :thursday, :teenth) == {2013, 6, 13}
  end

  @tag :pending
  test "thursteenth of september 2013" do
    assert Meetup.meetup(2013, 9, :thursday, :teenth) == {2013, 9, 19}
  end

  @tag :pending
  test "friteenth of april 2013" do
    assert Meetup.meetup(2013, 4, :friday, :teenth) == {2013, 4, 19}
  end

  @tag :pending
  test "friteenth of august 2013" do
    assert Meetup.meetup(2013, 8, :friday, :teenth) == {2013, 8, 16}
  end

  @tag :pending
  test "friteenth of september 2013" do
    assert Meetup.meetup(2013, 9, :friday, :teenth) == {2013, 9, 13}
  end

  @tag :pending
  test "saturteenth of february 2013" do
    assert Meetup.meetup(2013, 2, :saturday, :teenth) == {2013, 2, 16}
  end

  @tag :pending
  test "saturteenth of april 2013" do
    assert Meetup.meetup(2013, 4, :saturday, :teenth) == {2013, 4, 13}
  end

  @tag :pending
  test "saturteenth of october 2013" do
    assert Meetup.meetup(2013, 10, :saturday, :teenth) == {2013, 10, 19}
  end

  @tag :pending
  test "sunteenth of may 2013" do
    assert Meetup.meetup(2013, 5, :sunday, :teenth) == {2013, 5, 19}
  end

  @tag :pending
  test "sunteenth of june 2013" do
    assert Meetup.meetup(2013, 6, :sunday, :teenth) == {2013, 6, 16}
  end

  @tag :pending
  test "sunteenth of october 2013" do
    assert Meetup.meetup(2013, 10, :sunday, :teenth) == {2013, 10, 13}
  end

  @tag :pending
  test "first monday of march 2013" do
    assert Meetup.meetup(2013, 3, :monday, :first) == {2013, 3, 4}
  end

  @tag :pending
  test "first monday of april 2013" do
    assert Meetup.meetup(2013, 4, :monday, :first) == {2013, 4, 1}
  end

  @tag :pending
  test "first tuesday of may 2013" do
    assert Meetup.meetup(2013, 5, :tuesday, :first) == {2013, 5, 7}
  end

  @tag :pending
  test "first tuesday of june 2013" do
    assert Meetup.meetup(2013, 6, :tuesday, :first) == {2013, 6, 4}
  end

  @tag :pending
  test "first wednesday of july 2013" do
    assert Meetup.meetup(2013, 7, :wednesday, :first) == {2013, 7, 3}
  end

  @tag :pending
  test "first wednesday of august 2013" do
    assert Meetup.meetup(2013, 8, :wednesday, :first) == {2013, 8, 7}
  end

  @tag :pending
  test "first thursday of september 2013" do
    assert Meetup.meetup(2013, 9, :thursday, :first) == {2013, 9, 5}
  end

  @tag :pending
  test "first thursday of october 2013" do
    assert Meetup.meetup(2013, 10, :thursday, :first) == {2013, 10, 3}
  end

  @tag :pending
  test "first friday of november 2013" do
    assert Meetup.meetup(2013, 11, :friday, :first) == {2013, 11, 1}
  end

  @tag :pending
  test "first friday of december 2013" do
    assert Meetup.meetup(2013, 12, :friday, :first) == {2013, 12, 6}
  end

  @tag :pending
  test "first saturday of january 2013" do
    assert Meetup.meetup(2013, 1, :saturday, :first) == {2013, 1, 5}
  end

  @tag :pending
  test "first saturday of february 2013" do
    assert Meetup.meetup(2013, 2, :saturday, :first) == {2013, 2, 2}
  end

  @tag :pending
  test "first sunday of march 2013" do
    assert Meetup.meetup(2013, 3, :sunday, :first) == {2013, 3, 3}
  end

  @tag :pending
  test "first sunday of april 2013" do
    assert Meetup.meetup(2013, 4, :sunday, :first) == {2013, 4, 7}
  end

  @tag :pending
  test "second monday of march 2013" do
    assert Meetup.meetup(2013, 3, :monday, :second) == {2013, 3, 11}
  end

  @tag :pending
  test "second monday of april 2013" do
    assert Meetup.meetup(2013, 4, :monday, :second) == {2013, 4, 8}
  end

  @tag :pending
  test "second tuesday of may 2013" do
    assert Meetup.meetup(2013, 5, :tuesday, :second) == {2013, 5, 14}
  end

  @tag :pending
  test "second tuesday of june 2013" do
    assert Meetup.meetup(2013, 6, :tuesday, :second) == {2013, 6, 11}
  end

  @tag :pending
  test "second wednesday of july 2013" do
    assert Meetup.meetup(2013, 7, :wednesday, :second) == {2013, 7, 10}
  end

  @tag :pending
  test "second wednesday of august 2013" do
    assert Meetup.meetup(2013, 8, :wednesday, :second) == {2013, 8, 14}
  end

  @tag :pending
  test "second thursday of september 2013" do
    assert Meetup.meetup(2013, 9, :thursday, :second) == {2013, 9, 12}
  end

  @tag :pending
  test "second thursday of october 2013" do
    assert Meetup.meetup(2013, 10, :thursday, :second) == {2013, 10, 10}
  end

  @tag :pending
  test "second friday of november 2013" do
    assert Meetup.meetup(2013, 11, :friday, :second) == {2013, 11, 8}
  end

  @tag :pending
  test "second friday of december 2013" do
    assert Meetup.meetup(2013, 12, :friday, :second) == {2013, 12, 13}
  end

  @tag :pending
  test "second saturday of january 2013" do
    assert Meetup.meetup(2013, 1, :saturday, :second) == {2013, 1, 12}
  end

  @tag :pending
  test "second saturday of february 2013" do
    assert Meetup.meetup(2013, 2, :saturday, :second) == {2013, 2, 9}
  end

  @tag :pending
  test "second sunday of march 2013" do
    assert Meetup.meetup(2013, 3, :sunday, :second) == {2013, 3, 10}
  end

  @tag :pending
  test "second sunday of april 2013" do
    assert Meetup.meetup(2013, 4, :sunday, :second) == {2013, 4, 14}
  end

  @tag :pending
  test "third monday of march 2013" do
    assert Meetup.meetup(2013, 3, :monday, :third) == {2013, 3, 18}
  end

  @tag :pending
  test "third monday of april 2013" do
    assert Meetup.meetup(2013, 4, :monday, :third) == {2013, 4, 15}
  end

  @tag :pending
  test "third tuesday of may 2013" do
    assert Meetup.meetup(2013, 5, :tuesday, :third) == {2013, 5, 21}
  end

  @tag :pending
  test "third tuesday of june 2013" do
    assert Meetup.meetup(2013, 6, :tuesday, :third) == {2013, 6, 18}
  end

  @tag :pending
  test "third wednesday of july 2013" do
    assert Meetup.meetup(2013, 7, :wednesday, :third) == {2013, 7, 17}
  end

  @tag :pending
  test "third wednesday of august 2013" do
    assert Meetup.meetup(2013, 8, :wednesday, :third) == {2013, 8, 21}
  end

  @tag :pending
  test "third thursday of september 2013" do
    assert Meetup.meetup(2013, 9, :thursday, :third) == {2013, 9, 19}
  end

  @tag :pending
  test "third thursday of october 2013" do
    assert Meetup.meetup(2013, 10, :thursday, :third) == {2013, 10, 17}
  end

  @tag :pending
  test "third friday of november 2013" do
    assert Meetup.meetup(2013, 11, :friday, :third) == {2013, 11, 15}
  end

  @tag :pending
  test "third friday of december 2013" do
    assert Meetup.meetup(2013, 12, :friday, :third) == {2013, 12, 20}
  end

  @tag :pending
  test "third saturday of january 2013" do
    assert Meetup.meetup(2013, 1, :saturday, :third) == {2013, 1, 19}
  end

  @tag :pending
  test "third saturday of february 2013" do
    assert Meetup.meetup(2013, 2, :saturday, :third) == {2013, 2, 16}
  end

  @tag :pending
  test "third sunday of march 2013" do
    assert Meetup.meetup(2013, 3, :sunday, :third) == {2013, 3, 17}
  end

  @tag :pending
  test "third sunday of april 2013" do
    assert Meetup.meetup(2013, 4, :sunday, :third) == {2013, 4, 21}
  end

  @tag :pending
  test "fourth monday of march 2013" do
    assert Meetup.meetup(2013, 3, :monday, :fourth) == {2013, 3, 25}
  end

  @tag :pending
  test "fourth monday of april 2013" do
    assert Meetup.meetup(2013, 4, :monday, :fourth) == {2013, 4, 22}
  end

  @tag :pending
  test "fourth tuesday of may 2013" do
    assert Meetup.meetup(2013, 5, :tuesday, :fourth) == {2013, 5, 28}
  end

  @tag :pending
  test "fourth tuesday of june 2013" do
    assert Meetup.meetup(2013, 6, :tuesday, :fourth) == {2013, 6, 25}
  end

  @tag :pending
  test "fourth wednesday of july 2013" do
    assert Meetup.meetup(2013, 7, :wednesday, :fourth) == {2013, 7, 24}
  end

  @tag :pending
  test "fourth wednesday of august 2013" do
    assert Meetup.meetup(2013, 8, :wednesday, :fourth) == {2013, 8, 28}
  end

  @tag :pending
  test "fourth thursday of september 2013" do
    assert Meetup.meetup(2013, 9, :thursday, :fourth) == {2013, 9, 26}
  end

  @tag :pending
  test "fourth thursday of october 2013" do
    assert Meetup.meetup(2013, 10, :thursday, :fourth) == {2013, 10, 24}
  end

  @tag :pending
  test "fourth friday of november 2013" do
    assert Meetup.meetup(2013, 11, :friday, :fourth) == {2013, 11, 22}
  end

  @tag :pending
  test "fourth friday of december 2013" do
    assert Meetup.meetup(2013, 12, :friday, :fourth) == {2013, 12, 27}
  end

  @tag :pending
  test "fourth saturday of january 2013" do
    assert Meetup.meetup(2013, 1, :saturday, :fourth) == {2013, 1, 26}
  end

  @tag :pending
  test "fourth saturday of february 2013" do
    assert Meetup.meetup(2013, 2, :saturday, :fourth) == {2013, 2, 23}
  end

  @tag :pending
  test "fourth sunday of march 2013" do
    assert Meetup.meetup(2013, 3, :sunday, :fourth) == {2013, 3, 24}
  end

  @tag :pending
  test "fourth sunday of april 2013" do
    assert Meetup.meetup(2013, 4, :sunday, :fourth) == {2013, 4, 28}
  end

  @tag :pending
  test "last monday of march 2013" do
    assert Meetup.meetup(2013, 3, :monday, :last) == {2013, 3, 25}
  end

  @tag :pending
  test "last monday of april 2013" do
    assert Meetup.meetup(2013, 4, :monday, :last) == {2013, 4, 29}
  end

  @tag :pending
  test "last tuesday of may 2013" do
    assert Meetup.meetup(2013, 5, :tuesday, :last) == {2013, 5, 28}
  end

  @tag :pending
  test "last tuesday of june 2013" do
    assert Meetup.meetup(2013, 6, :tuesday, :last) == {2013, 6, 25}
  end

  @tag :pending
  test "last wednesday of july 2013" do
    assert Meetup.meetup(2013, 7, :wednesday, :last) == {2013, 7, 31}
  end

  @tag :pending
  test "last wednesday of august 2013" do
    assert Meetup.meetup(2013, 8, :wednesday, :last) == {2013, 8, 28}
  end

  @tag :pending
  test "last thursday of september 2013" do
    assert Meetup.meetup(2013, 9, :thursday, :last) == {2013, 9, 26}
  end

  @tag :pending
  test "last thursday of october 2013" do
    assert Meetup.meetup(2013, 10, :thursday, :last) == {2013, 10, 31}
  end

  @tag :pending
  test "last friday of november 2013" do
    assert Meetup.meetup(2013, 11, :friday, :last) == {2013, 11, 29}
  end

  @tag :pending
  test "last friday of december 2013" do
    assert Meetup.meetup(2013, 12, :friday, :last) == {2013, 12, 27}
  end

  @tag :pending
  test "last saturday of january 2013" do
    assert Meetup.meetup(2013, 1, :saturday, :last) == {2013, 1, 26}
  end

  @tag :pending
  test "last saturday of february 2013" do
    assert Meetup.meetup(2013, 2, :saturday, :last) == {2013, 2, 23}
  end

  @tag :pending
  test "last sunday of march 2013" do
    assert Meetup.meetup(2013, 3, :sunday, :last) == {2013, 3, 31}
  end

  @tag :pending
  test "last sunday of april 2013" do
    assert Meetup.meetup(2013, 4, :sunday, :last) == {2013, 4, 28}
  end
end

# Meetup

Calculate the date of meetups.

Typically meetups happen on the same day of the week.

Examples are

- the first Monday
- the third Tuesday
- the Wednesteenth
- the last Thursday

Note that "Monteenth", "Tuesteenth", etc are all made up words. There
was a meetup whose members realised that there are exactly 7 days that
end in '-teenth'. Therefore, one is guaranteed that each day of the week
(Monday, Tuesday, ...) will have exactly one date that is named with '-teenth'
in every month.

## Running tests

```bash
$ elixir bob_test.exs
```

(Replace `bob_test.exs` with the name of the test file.)

## Source

Jeremy Hinegardner mentioned a Boulder meetup that happens on the Wednesteenth of every month [view source](https://twitter.com/copiousfreetime)
defmodule DNA do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> DNA.count('AATAA', ?A)
  4

  iex> DNA.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do

  end


  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> DNA.nucleotide_counts('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec nucleotide_counts([char]) :: Dict.t
  def nucleotide_counts(strand) do

  end
end
if System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("example.exs")
else
  Code.load_file("dna.exs")
end

ExUnit.start
ExUnit.configure exclude: :pending

defmodule DNATest do
  use ExUnit.Case, async: true

  # @tag :pending
  test "empty dna string has no adenosine" do
    assert DNA.count('', ?A) == 0
  end

  @tag :pending
  test "empty dna string has no nucleotides" do
    expected = %{?A => 0, ?T => 0, ?C => 0, ?G => 0}
    assert DNA.nucleotide_counts('') == expected
  end

  @tag :pending
  test "repetitive cytidine gets counted" do
    assert DNA.count('CCCCC', ?C) == 5
  end

  @tag :pending
  test "repetitive sequence has only guanosine" do
    expected = %{?A => 0, ?T => 0, ?C => 0, ?G => 8}
    assert DNA.nucleotide_counts('GGGGGGGG') == expected
  end

  @tag :pending
  test "counts only thymidine" do
    assert DNA.count('GGGGGTAACCCGG', ?T) == 1
  end

  @tag :pending
  test "dna has no uracil" do
    assert DNA.count('GATTACA', ?U) == 0
  end

  @tag :pending
  test "counts all nucleotides" do
    s = 'AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC'
    expected = %{?A => 20, ?T => 21, ?C => 12, ?G => 17}
    assert DNA.nucleotide_counts(s) == expected
  end
end

defmodule Phone do
  @doc """
  Remove formatting from a phone number.

  Returns "0000000000" if phone number is not valid
  (10 digits or "1" followed by 10 digits)

  ## Examples

  iex> Phone.number("123-456-7890")
  "1234567890"

  iex> Phone.number("+1 (303) 555-1212")
  "3035551212"

  iex> Phone.number("867.5309")
  "0000000000"
  """

  @spec number(String.t) :: String.t
  def number(raw) do

  end

  @doc """
  Extract the area code from a phone number

  Returns the first three digits from a phone number,
  ignoring long distance indicator

  ## Examples

  iex> Phone.area_code("123-456-7890")
  "123"

  iex> Phone.area_code("+1 (303) 555-1212")
  "303"

  iex> Phone.area_code("867.5309")
  "000"
  """
  @spec area_code(String.t) :: String.t
  def area_code(raw) do
  
  end

  @doc """
  Pretty print a phone number

  Wraps the area code in parentheses and separates
  exchange and subscriber number with a dash.

  ## Examples

  iex> Phone.pretty("123-456-7890")
  "(123) 456-7890"

  iex> Phone.pretty("+1 (303) 555-1212")
  "(303) 555-1212"

  iex> Phone.pretty("867.5309")
  "(000) 000-0000"
  """
  @spec pretty(String.t) :: String.t
  def pretty(raw) do
  
  end
end
if System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("example.exs")
else
  Code.load_file("phone_number.exs")
end

ExUnit.start
ExUnit.configure(exclude: :pending)

defmodule PhoneTest do
  use ExUnit.Case, async: true

  test "cleans number" do
    assert Phone.number("(123) 456-7890") == "1234567890"
  end

  @tag :pending
  test "cleans number with dots" do
    assert Phone.number("123.456.7890") == "1234567890"
  end

  @tag :pending
  test "valid when 11 digits and first is 1" do
    assert Phone.number("11234567890") == "1234567890"
  end

  @tag :pending
  test "invalid when 11 digits" do
    assert Phone.number("21234567890") == "0000000000"
  end

  @tag :pending
  test "invalid when 9 digits" do
    assert Phone.number("123456789") == "0000000000"
  end

  @tag :pending
  test "invalid when proper number of digits but letters mixed in" do
    assert Phone.number("1a2a3a4a5a6a7a8a9a0a") == "0000000000"
  end

  @tag :pending
  test "area code" do
    assert Phone.area_code("1234567890") == "123"
  end

  @tag :pending
  test "area code with full US phone number" do
    assert Phone.area_code("11234567890") == "123"
  end

  @tag :pending
  test "pretty print" do
    assert Phone.pretty("1234567890") == "(123) 456-7890"
  end

  @tag :pending
  test "pretty print with full US phone number" do
    assert Phone.pretty("11234567890") == "(123) 456-7890"
  end
end

defmodule DNA do
