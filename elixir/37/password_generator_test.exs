Code.load_file("password_generator.exs")
ExUnit.start

defmodule Test do
  alias Password, as: GP
  use ExUnit.Case, async: true

  test "special character list" do
    list = GP.special_character_list
    assert String.contains?(list |> to_string, "?") == true
    assert String.contains?(list |> to_string, "!") == true
    assert String.contains?(list |> to_string, "~") == true
    assert String.contains?(list |> to_string, "@") == true
    assert String.contains?(list |> to_string, "#") == true
    assert String.contains?(list |> to_string, "$") == true
    assert String.contains?(list |> to_string, "%") == true
    assert String.contains?(list |> to_string, "^") == true
    assert String.contains?(list |> to_string, "&") == true
    assert String.contains?(list |> to_string, "*") == true
    assert String.contains?(list |> to_string, "(") == true
    assert String.contains?(list |> to_string, ")") == true
    assert String.contains?(list |> to_string, "_") == true
    assert String.contains?(list |> to_string, "+") == true
    assert String.contains?(list |> to_string, "-") == true
    assert String.contains?(list |> to_string, "=") == true
    assert String.contains?(list |> to_string, "<") == true
    assert String.contains?(list |> to_string, ">") == true
    assert String.contains?(list |> to_string, "?") == true
    assert String.contains?(list |> to_string, ",") == true
    assert String.contains?(list |> to_string, ".") == true
    assert String.contains?(list |> to_string, "/") == true
  end

  test "special character generation for 0" do
    assert GP.special_characters(0) == ""
  end

  test "special character generation length > 0" do
    generated_special_chars = GP.special_characters(5)

    assert String.length(generated_special_chars) == 5
  end

  test "number generation for 0" do
    assert GP.numbers(0) == ""
    assert String.length(GP.numbers(0)) == 0
  end

  test "padding with a-z" do
  end
end
