defmodule RootsWeb.Schema.UserTypes do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: Roots.Repo

  alias RootsWeb.Resolvers

  @desc "user of site"

  object :user do
    field :id, :id
    field :name, :string
    field :email, :string
    field :cookbooks, list_of(:cookbook)
  end
end
