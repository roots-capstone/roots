defmodule Roots.Recipe do
  use Roots.Model
  alias Roots.{Repo, Recipe}

  use Roots.Model

  alias Roots.Repo

  schema "recipes" do
    field :description, :string
    field :instructions, :string
    field :title, :string
    field :author, :string
    # has_many :ingredients, Roots.Ingredient
    belongs_to :cookbook, Roots.Cookbook

    timestamps()
  end

  def all do
    Repo.all(from row in __MODULE__, order_by: [desc: row.id])
  end

  @doc false
  def changeset(recipe, attrs) do
    recipe
    |> cast(attrs, [:title, :description, :instructions])
    |> validate_required([:title, :instructions, :author])
  end
end
