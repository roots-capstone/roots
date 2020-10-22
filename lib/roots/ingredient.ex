defmodule Roots.Ingredient do
  use Ecto.Schema
  import Ecto.Changeset

  schema "ingredients" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(ingredient, attrs) do
    ingredient
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
