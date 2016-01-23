require IEx

defmodule UrlShortner.UrlController do
  use UrlShortner.Web, :controller

  def index(conn, _params) do
    conn
    |> assign(:urls, Repo.all(UrlShortner.Url))
    |> render("index.html")
  end

  def create(conn, params) do
    #IEx.pry
    url = Map.get(params, "url", 0)
    url = %UrlShortner.Url{
      visit_count: 0,
      full_url: Map.get(url, "full_url", 1),
      short_url: Map.get(params, "_csrf_token", 1)
    }
    Repo.insert(url)

    redirect conn, to: url_path(conn, :index)
  end
end
