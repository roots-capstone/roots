defmodule RootsWeb.Schema.RecipeTypes do
  use Absinthe.Schema.Notation
  import Absinthe.Resolution.Helpers, only: [dataloader: 1, dataloader: 3]

  alias RootsWeb.Resolvers

  @desc "recipe"

  object :recipe do
    field :id, :id
    field :title, :string
    field :author, :string
    field :description, :string
    field :instructions, :string
    field :ingredients, list_of(:ingredient), resolve: dataloader(Data)
    field :cookbook, :cookbook, resolve: dataloader(Data)
  end
end
