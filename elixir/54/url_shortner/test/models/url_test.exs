defmodule UrlShortner.UrlTest do
  use UrlShortner.ModelCase

  alias UrlShortner.Url

  @valid_attrs %{full_url: "some content", short_url: "some content", visit_count: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Url.changeset(%Url{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Url.changeset(%Url{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "encode converts base10 to base62" do
    to_encode = 125
    result = "cb"
    assert Url.encode(to_encode) == result
  end

  test "decode converts base62 to base10" do
    to_decode = "cb"
    result = 125
    assert Url.decode(to_decode) == result
  end
end
