defmodule RootsWeb.Schema.IngredientTypes do
  use Absinthe.Schema.Notation
  import Absinthe.Resolution.Helpers, only: [dataloader: 1, dataloader: 3]

  alias RootsWeb.Resolvers

  @desc "ingredient"

  object :ingredient do
    field :id, :id
    field :name, :string
    field :amount, :float
    field :unit, :string
    field :recipe, :recipe, resolve: dataloader(Data)
  end
end
