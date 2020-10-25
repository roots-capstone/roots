defmodule RootsWeb.Schema.CookbookTypes do
  use Absinthe.Schema.Notation
  import Absinthe.Resolution.Helpers, only: [dataloader: 1, dataloader: 3]

  alias RootsWeb.Resolvers

  @desc "cookbook"

  object :cookbook do
    field :id, :id
    field :author, :string
    field :title, :string
    field :recipes, list_of(:recipe), resolve: dataloader(Data)
    field :user, :user, resolve: dataloader(Data)
  end
end
