defmodule Roots.Cookbook do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cookbooks" do
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(cookbook, attrs) do
    cookbook
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end
end
