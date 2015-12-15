Code.load_file("password_generator.exs")


length        = IO.gets("What's the minimum length? ") |> String.strip |> String.to_integer
special_count = IO.gets("How many special characters? ") |> String.strip |> String.to_integer
numbers_count = IO.gets("How many numbers? ") |> String.strip |> String.to_integer

password = Password.generate(length, special_count, numbers_count)
IO.puts "Your password is #{password}"
