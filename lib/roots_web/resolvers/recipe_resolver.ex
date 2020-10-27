defmodule RootsWeb.Resolvers.RecipekResolver do
  alias Roots.Recipe

  def list(_parent, _args, _resolutions) do
    {:ok, Recipe.all()}
  end

  def show(_parent, args, _resolutions) do
    case Recipe.find(args[:id]) do
      nil -> {:error, "Not found"}
      recipe -> {:ok, recipe}
    end
  end
end
