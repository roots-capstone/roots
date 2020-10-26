defmodule RootsWeb.Schema.UserTypes do
  use Absinthe.Schema.Notation

  import Absinthe.Resolution.Helpers, only: [dataloader: 1]

  alias RootsWeb.{Data, Resolvers}

  @desc "A user of the site"
  object :user do
    field :id, :id
    field :name, :string
    field :email, :string

    field :cookbooks, list_of(:cookbook), resolve: dataloader(Data)
  end

  object :user_mutations do

    @desc "Create User"
    field :createUser, :user do
      arg(:name, non_null(:string))
      arg(:email, non_null(:string))

      resolve(&Resolvers.UserResolver.createUser/3)
    end
  end
end
