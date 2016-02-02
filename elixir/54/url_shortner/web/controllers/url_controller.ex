require IEx

defmodule UrlShortner.UrlController do
  use UrlShortner.Web, :controller

  def index(conn, _params) do
    conn
    |> assign(:urls, Repo.all(UrlShortner.Url))
    |> render("index.html")
  end

  def create(conn, params) do
    url = Map.get(params, "url", 0)
    full_url = Map.get(url, "full_url", 1)
    url = %UrlShortner.Url{
      visit_count: 0, # Could make this default
      full_url: full_url
    }
    {:ok, recent_url} = Repo.insert(url)
    id = Map.get(recent_url, :id)
    updated_url = %{
      recent_url | short_url: UrlShortner.Url.encode(id)
    }
    Repo.update(updated_url)

    redirect conn, to: url_path(conn, :index)
  end

  def show(conn, params) do
    url_id = Map.get(params, "shortened_url")
             |> UrlShortner.Url.decode

    full_url = Repo.get(UrlShortner.Url, url_id)
               |> Map.get(:full_url)
    redirect conn, external: full_url
  end
end
