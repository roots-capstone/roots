defmodule Roots.Cookbook do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cookbooks" do
    field :author, :string
    field :title, :string
    has_many :recipes, Roots.Recipe
    belongs_to :user, Roots.User

    timestamps()
  end

  @doc false
  def changeset(cookbook, attrs) do
    cookbook
    |> cast(attrs, [:title, :author])
    |> validate_required([:title, :author])
  end
end
