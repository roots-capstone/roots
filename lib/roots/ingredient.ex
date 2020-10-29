defmodule Roots.Ingredient do
  use Roots.Model

  alias Roots.{Repo, Ingredient}


  schema "ingredients" do
    field :name, :string
    field :amount, :float
    field :unit, :string
    belongs_to :recipe, Roots.Recipe

    timestamps()
  end

  @doc false
  def changeset(ingredient, attrs) do
    ingredient
    |> cast(attrs, [:name, :amount, :unit, :recipe_id])
    |> validate_required([:name, :amount, :unit, :recipe_id])
    |> cast_assoc(:recipe)
  end
end
