defmodule RootsWeb.Schema.CookbookTypes do
  use Absinthe.Schema.Notation

  import Absinthe.Resolution.Helpers, only: [dataloader: 1]

  alias RootsWeb.{Data, Resolvers}

  @desc "Cookbook"
  object :cookbook do
    field :id, :id
    field :author, :string
    field :title, :string

    field :user, :user, resolve: dataloader(Data)
    field :recipes, list_of(:recipe), resolve: dataloader(Data)
  end

  object :cookbook_queries do
    @desc "Get specific cookbook"
    field :get_cookbook, :cookbook do
      arg(:id, non_null(:id))
      
      resolve(&Resolvers.CookbookResolver.show/3)
    end

    @desc "Get all cookbooks"
    field :get_cookbooks, list_of(:cookbook) do

      resolve(&Resolvers.CookbookResolver.list/3)
    end
  end

  object :cookbook_mutations do
    @desc "Create a new cookbook"
    field :create_cookbook, type: :cookbook do
      arg(:title, non_null(:string))
      arg(:author, non_null(:string))
      arg(:user_id, non_null(:id))

      resolve(&Resolvers.CookbookResolver.create_cookbook/3)
    end
  end
end
