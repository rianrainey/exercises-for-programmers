require IEx

defmodule MovieRecommendations do
  def process do
    prompt
    |> movie_api_url
    |> URI.encode
    |> HTTPoison.get([{"User-agent", "Anything can go here"}])
    |> handle_response
    |> pretty_print
  end

  def prompt do
    IO.gets "Enter movie title: "
  end

  def handle_response({ :ok,
                        %HTTPoison.Response{body: body, headers: headers, status_code: 200}}) do
    case Poison.decode body do
      { :ok, %{ "Error" => message, "Response" => "False" }} -> "Error: #{message}"
      { :ok, movie }                                         -> movie
    end
  end

  def pretty_print(movie) do
    IO.puts "Title: #{Map.get(movie, "Title")}"
    IO.puts "Year: #{Map.get(movie, "Year")}"
    IO.puts "Rating: #{Map.get(movie, "imdbRating")}"
    IO.puts "Running Time: #{Map.get(movie, "Runtime")}"
    IO.puts "Description: #{Map.get(movie, "Plot")}"
  end

  def movie_api_url(query) do
    "http://omdbapi.com/?t=#{String.strip(query)}"
  end

  def watch_recommendation(_) do
    "You should watch this movie right now!"
  end
end
