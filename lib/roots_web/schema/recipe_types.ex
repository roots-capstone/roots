defmodule RootsWeb.Schema.RecipeTypes do
  use Absinthe.Schema.Notation

  import Absinthe.Resolution.Helpers, only: [dataloader: 1]

  alias RootsWeb.{Data, Resolvers}

  @desc "A recipe"
  object :recipe do
    field :id, :id
    field :description, :string
    field :instructions, :string
    field :title, :string
    field :author, :string

    field :cookbook, :cookbook, resolve: dataloader(Data)
    # field :ingredients, list_of(:ingredient), resolve: dataloader(Data)
  end

  object :recipe_mutations do
    @desc "Create Recipe"
    field :create_recipe, type: :recipe do
      arg(:description, non_null(:string))
      arg(:instructions, non_null(:string))
      arg(:title, non_null(:string))
      arg(:author, non_null(:string))
      arg(:cookbook, non_null(:integer))

      resolve &Resolvers.RecipeResolver.create_recipe/3
    end
  end
end
