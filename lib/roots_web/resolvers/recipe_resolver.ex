defmodule RootsWeb.Resolvers.RecipeResolver do
  alias Roots.Recipe

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
