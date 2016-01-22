defmodule UrlShortner.UrlController do
  use UrlShortner.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
