defmodule RootsWeb.Resolvers.RecipeResolver do
  alias Roots.Recipe

  def create_recipe(_parent, args, _resolution) do

    case Recipe.create(args) do
      {:ok, recipe} ->
        {:ok, recipe}
        _error ->
        {:error, "Could not create recipe"}
    end
  end
end
