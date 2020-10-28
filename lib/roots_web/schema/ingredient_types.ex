defmodule RootsWeb.Schema.IngredientTypes do
  use Absinthe.Schema.Notation

  import Absinthe.Resolution.Helpers, only: [dataloader: 1]

  alias RootsWeb.{Data, Resolvers}

  @desc "Ingredient"
  object :ingredient do
    field :id, :id
    field :amount, :float
    field :name, :string
    field :unit, :string

    field :recipe, :recipe, resolve: dataloader(Data)
  end

  object :ingredient_mutations do
    @desc "Create Ingredient"
    field :create_ingredient, type: :ingredient do
      arg(:amount, non_null(:float))
      arg(:name, non_null(:string))
      arg(:unit, non_null(:string))
      arg(:recipe_id, non_null(:id))

      resolve(&Resolvers.IngredientResolver.create_ingredient/3)
    end
  end
end
