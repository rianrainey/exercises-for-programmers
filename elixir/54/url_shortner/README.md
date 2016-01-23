# UrlShortner

To start your Phoenix app:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `npm install`
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`lvh.me:4000`](http://lvh.me:4000) from your browser.

## Features

- [] Visit root_url, enter fully qualified url(fqurl), get shortned path link back
- [] `/get#short_url`
  - [] Redirects to fqurl
  - [] Increments `visit_count`
- [] `/get/#short_url/stats` - show `short_url`, `full_url`, and `visit_count`
  - [] Show ip addresses and geographic locations
- [] Log ip address of visitors
- [] Save urls to user accounts
- [] Extract url shortner logic to library? Or is that just one method?

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).
