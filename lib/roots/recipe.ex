defmodule Roots.Recipe do
  use Ecto.Schema
  import Ecto.Changeset

  schema "recipes" do
    field :description, :string
    field :instructions, :string
    field :title, :string
    field :author, :string
    has_many :ingredients, Roots.Ingredient
    belongs_to :cookbook, Roots.Cookbook

    timestamps()
  end

  @doc false
  def changeset(recipe, attrs) do
    recipe
    |> cast(attrs, [:title, :description, :instructions])
    |> validate_required([:title, :instructions, :author])
  end
end
