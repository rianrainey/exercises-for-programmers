require IEx

defmodule UrlShortner.Url do
  use UrlShortner.Web, :model

  schema "urls" do
    field :visit_count, :integer
    field :short_url, :string
    field :full_url, :string

    timestamps
  end

  @required_fields ~w(visit_count short_url full_url)
  @optional_fields ~w()
  @base 62

  # Thanks to Chris Doggett!
  @alphabet [?a..?z, ?A..?Z, ?0..?9] # ? Gets codepoint(e.g. ?a = 97, ?ł = 322). For non-integers, it tries to interpret as variable or method name
    |> Enum.flat_map(fn x -> x end) # Enum#each returns :ok. Enum#map returns same codepoints as above. ??? Not sure why #flat_map works?
    |> to_string # Kernal#to_string macro. I would have ignorantly used String#to_string.
    |> String.split("", trim: true) # String#split/3. Trim removes empty strings. ??? When would there be empty strings from these ranges?
    |> Enum.take(@base) # Take as many chars as in your base

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end

  @doc """
  Return base number of chars from the range a-z, A-Z, 0-9
  iex> alphabet(3)
  "0", "1", "2"
  """

  for {char, ix} <- (@alphabet |> Enum.with_index) do
    IEx.pry
    defp index_of(unquote(char)), do: unquote(ix)
    defp char_at(unquote(ix)), do: unquote(char)
  end
  #def char_at(position) do
    #alphabet(@base)
    #|> Enum.at(position)
  #end

  #def index_of(char) do
    #alphabet(@base)
    #|> Enum.at(char)
  #end

  @doc """
  int - base10 integer awesome
  Take a base10 integer, convert to base 62, and map to alphabet
  by summing the product of quotient times 62^remainder
  e.g. 125 = 2x62^1 + 1x62^0 = 124 + 1
  Once the quotients are derived, those provide the map
  into the shortner alphabet
  0 -> a
  1 -> b
  2 -> c
  ...
  61 -> 9
  Hence, [2,1] would map to [c,b], which is url.com/cb
  >iex Url.encode(125)
  "cb"
  """
  def encode(int) when is_integer(int) do
    encode(div(int, @base), rem(int, @base), "")
  end
  defp encode(0, mod, str), do: char_at(mod) <> str
  defp encode(int, mod, str) when is_integer(int) do
    encode(div(int, @base), rem(int, @base), char_at(mod) <> str)
  end

  @doc """
  str - base62 string
  >iex Url.decode("cb")
  125
  """
  def decode(str) do
    String.reverse(str)
    |> String.split("", trim: true)
    |> Enum.with_index # [{"c", 0}, {"b", 1}]
    |> Enum.reduce(0, fn({char, index}, acc) -> acc + index_of(char) * (:math.pow(@base, index) |> round) end)
  end
end
