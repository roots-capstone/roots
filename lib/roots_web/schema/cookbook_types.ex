defmodule RootsWeb.Schema.CookbookTypes do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: Roots.Repo

  alias RootsWeb.Resolvers

  @desc "cookbook"

  object :cookbook do
    field :id, :id
    field :author, :string
    field :title, :string
    field :recipes, list_of(:recipes)
    field :user, :user
  end
end
