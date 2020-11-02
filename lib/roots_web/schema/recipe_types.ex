defmodule RootsWeb.Schema.RecipeTypes do
  use Absinthe.Schema.Notation

  import Absinthe.Resolution.Helpers, only: [dataloader: 1]

  alias RootsWeb.{Data, Resolvers}

  @desc "Ingredient for recipe"
  input_object :recipe_ingredient do
    field :amount, :float
    field :name, :string
    field :unit, :string
  end

  @desc "Recipe"
  object :recipe do
    field :id, :id
    field :description, :string
    field :instructions, :string
    field :title, :string
    field :author, :string

    field :cookbook, :cookbook, resolve: dataloader(Data)
    field :ingredients, list_of(:ingredient), resolve: dataloader(Data)
  end

  object :recipe_mutations do
    @desc "Create Recipe"
    field :create_recipe, type: :recipe do
      arg(:description, non_null(:string))
      arg(:instructions, non_null(:string))
      arg(:title, non_null(:string))
      arg(:author, non_null(:string))
      arg(:cookbook_id, non_null(:id))
      arg(:recipe_ingredient, non_null(:recipe_ingredient))

      resolve &Resolvers.RecipeResolver.create_recipe/3
    end
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
