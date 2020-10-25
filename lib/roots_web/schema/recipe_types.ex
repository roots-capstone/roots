defmodule RootsWeb.Schema.RecipeTypes do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: Roots.Repo

  alias RootsWeb.Resolvers

  @desc "recipe"

  object :recipe do
    field :id, :id
    field :title, :string
    field :author, :string
    field :description, :string
    field :instructions, :string
    field :ingredients, list_of(:ingredient)
    field :cookbook, :cookbook
  end
end
