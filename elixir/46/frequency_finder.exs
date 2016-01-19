defmodule FrequencyFinder do
  def run do
    prompt |>
    read_file #|>
    #words_in_file #|>
    #frequency_of_words #|>
    #print_frequency
  end

  defp prompt do
    IO.get("Provide path to word file: ")
  end

  defp read_file(filepath) do
    IO.puts filepath
  end
end
