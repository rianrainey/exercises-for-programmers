defmodule UrlShortner.Repo.Migrations.CreateUrl do
  use Ecto.Migration

  def change do
    create table(:urls) do
      add :visit_count, :integer
      add :short_url, :string
      add :full_url, :string

      timestamps
    end

  end
end
