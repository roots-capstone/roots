defmodule Roots.Ingredient do
  use Ecto.Schema
  import Ecto.Changeset

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
    |> cast(attrs, [:name, :amount, :unit])
    |> validate_required([:name, :amount, :unit])
    |> cast_assoc(:recipe)
  end
end
