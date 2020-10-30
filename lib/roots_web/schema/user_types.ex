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

  object :user_queries do
    @desc "Get cookbooks"
    field :get_user_cookbooks, list_of(:cookbook) do
      arg(:id, non_null(:id))

      resolve(&Resolvers.UserResolver.cookbook_list/3)
    end
  end

  object :user_mutations do
    @desc "Create User"
    field :create_user, type: :user do
      arg(:name, non_null(:string))
      arg(:email, non_null(:string))

      resolve(&Resolvers.UserResolver.create_user/3)
    end
  end
end
