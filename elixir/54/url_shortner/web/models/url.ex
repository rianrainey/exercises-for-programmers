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

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
