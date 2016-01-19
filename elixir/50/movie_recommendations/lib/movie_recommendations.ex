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
      { :ok, %{ "Error" => message, "Response" => "False" }} -> "Error: #{message}" # TODO: Don't know how much of this is necessary
      { :ok, movie }                                         -> movie
    end
  end

  def pretty_print(movie) do
    # TODO: Move Movie out into it's own struct
    IO.puts """
    Title: #{Map.get(movie, "Title")}
    Year: #{Map.get(movie, "Year")}
    Rating: #{Map.get(movie, "imdbRating")}
    Running Time: #{Map.get(movie, "Runtime")}
    Description: #{Map.get(movie, "Plot")}
    """
    #{watch_recommendation(Map.get(movie, "imdbRating"))}
  end

  def movie_api_url(query) do
    "http://omdbapi.com/?t=#{String.strip(query)}"
  end

  #def watch_recommendation(score) do
  #end
end
