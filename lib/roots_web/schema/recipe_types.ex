defmodule RootsWeb.Schema.RecipeTypes do
  use Absinthe.Schema.Notation

  import Absinthe.Resolution.Helpers, only: [dataloader: 1]

  alias RootsWeb.{Data, Resolvers}

  @desc "Recipe"
  object :recipe do
    field :id, :id
    field :description, :string
    field :instructions, :string
    field :title, :string
    field :author, :string

    field :cookbook, :cookbook, resolve: dataloader(Data)
    # field :ingredients, list_of(:ingredient), resolve: dataloader(Data)
  end

  object :recipe_queries do
    @desc "Get all recipes"
    field :get_recipes, list_of(:recipe) do
      resolve(&Resolvers.RecipeResolver.list/3)
    end

    @desc "Get specific recipe"
    field :get_recipe, :recipe do
      arg(:id, non_null(:id))
      resolve(&Resolvers.RecipeResolver.show/3)
    end
  end
end
