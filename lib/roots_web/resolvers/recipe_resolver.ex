defmodule RootsWeb.Resolvers.RecipeResolver do
  import Ecto.Query
  alias Ecto.Multi
  alias Roots.Recipe

  def create_recipe(_parent, args, _resolution) do

    case Recipe.create(args) do
      {:ok, recipe} ->
        {:ok, recipe}
        _error ->
        {:error, "Could not create recipe"}
    end
  end

  def list(_parent, _args, _resolutions) do
    {:ok, Recipe.all()}
  end

  def show(_parent, args, _resolutions) do
    case Recipe.find(args[:id]) do
      nil -> {:error, "Recipe not found"}
      recipe -> {:ok, recipe}
    end
  end
end
