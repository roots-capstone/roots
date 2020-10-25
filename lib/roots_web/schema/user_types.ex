defmodule RootsWeb.Schema.UserTypes do
  use Absinthe.Schema.Notation
  import Absinthe.Resolution.Helpers, only: [dataloader: 1, dataloader: 3]

  alias RootsWeb.Resolvers

  @desc "user of site"

  object :user do
    field :id, :id
    field :name, :string
    field :email, :string
    field :cookbooks, list_of(:cookbook), resolve: dataloader(Data)
  end
end
