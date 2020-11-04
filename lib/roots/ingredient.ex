defmodule Roots.Ingredient do
  use Roots.Model

  alias Roots.{Repo, Recipe}

  schema "ingredients" do
    field :name, :string
    field :amount, :string
    field :unit, :string
    belongs_to :recipe, Recipe

    timestamps()
  end

  def all do
    Repo.all(from row in __MODULE__, order_by: [desc: row.id])
  end

  @doc false
  def changeset(ingredient, attrs) do
    ingredient
    |> cast(attrs, [:name, :amount, :unit, :recipe_id])
    |> validate_required([:name, :amount, :unit, :recipe_id])
    |> foreign_key_constraint(:recipe_id)
    |> cast_assoc(:recipe)
  end
end
