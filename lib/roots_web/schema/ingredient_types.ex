defmodule RootsWeb.Schema.IngredientTypes do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: Roots.Repo

  alias RootsWeb.Resolvers

  @desc "ingredient"

  object :ingredient do
    field :id, :id
    field :name, :string
    field :amount, :float
    field :unit, :string
    field :recipe, :recipe
  end
end
