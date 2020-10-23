defmodule Roots.Ingredient do
  use Ecto.Schema
  import Ecto.Changeset

  schema "ingredients" do
    field :amount, :float
    field :name, :string
    field :unit, :string
    belongs_to :recipe, Roots.Recipe

    timestamps()
  end

  @doc false
  def changeset(ingredient, attrs) do
    ingredient
    |> cast(attrs, [:name, :amount, :unit])
    |> validate_required([:name, :amount, :unit])
  end
end
