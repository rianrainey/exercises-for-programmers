require IEx
# What's the minimum length? 8
# How many special characters? 2
# How many numbers? 2
# Your password is aurn2$1s#

defmodule Password do
  def generate(length, special_count, number_count) do
    generated_special    = special_characters(special_count)
    generated_numbers    = numbers(number_count)
    remaining_char_count = remaining_count(length, special_count, number_count)
    generated_chars      = Enum.take_random(?a..?z, remaining_char_count)

    String.to_char_list("#{generated_special}#{generated_numbers}#{generated_chars}") |>
    Enum.shuffle
  end

  def remaining_count(desired_count, special_counter, number_counter) do
    desired_count - special_counter - number_counter
  end

  def special_character_list do
    '~!@#$%^&*()_+`-=<>?,./'
  end

  def special_characters(0), do: ""
  def special_characters(count) when count > 0 do
    Enum.take_random(special_character_list, count) |> to_string
  end

  def numbers(0), do: ""
  def numbers(count) when count > 0 do
    Enum.take_random(?0..?9, count)
  end

  #defp correct_user_inputs do
  ##    @minimum_length - @special_character_count - @numbers_count <= 0
  #end
end

# TODO: Handle wrong math from user input
