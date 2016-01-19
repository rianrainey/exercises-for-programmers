require IEx

defmodule Frequency do
  def process do
    prompt_for_file
    |> String.strip
    |> handle_file
    #|> pretty_print
  end

  def prompt_for_file do
    IO.gets "Provide path to word file: "
  end

  def handle_file(filepath) do
    case File.read(filepath) do
      {:ok, text} -> count(text)
      {:error, message} -> IO.puts "Error: #{message}"
    end
  end

  @doc """
  Given a string of text, return a map of {frequency => count} for
  each word found in the string.
  ## Example
  iex> text = "one two two three three three"
  iex> Frequency.count(text)
  %{"one" => 1, "two" => 2, "three" => 3}
  """
  def count(text) do
    String.split(text)
    |> Enum.reduce(%{}, &update_count/2)
  end
  defp update_count(word, acc) do
    Map.update(acc, word, 1, &(&1 + 1))
  end

#  @doc """
#  Given a key-value map, print the results
#  ## Example
#  iex> map = %{"one" => 1, "two" => 2, "three" => 3}
#  iex> Frequency.pretty_print(map)
#  three: ***
#  two:   **
#  one:   *
#  """
  def pretty_print(map) do
    for element <- map do
      #IO.puts "#{Kernel.elem(element, 0)}: #{print_multiple_times(" ", max_width_of(Enum.keys(map)))} #{print_multiple_times("*", Kernel.elem(element, 1))}"
    end
  end

  def max_width_of(words) do
    Enum.max_by(words, &String.length/1)
    |> String.length
  end

  def print_multiple_times(symbol, n) when n > 1 do
    IEx.pry
    IO.puts symbol
    print_multiple_times(symbol, n-1)
  end
  def print_multiple_times(symbol, n) when n == 1 do
    IO.puts symbol
  end
end
