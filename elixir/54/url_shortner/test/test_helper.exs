ExUnit.start

Mix.Task.run "ecto.create", ~w(-r UrlShortner.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r UrlShortner.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(UrlShortner.Repo)

