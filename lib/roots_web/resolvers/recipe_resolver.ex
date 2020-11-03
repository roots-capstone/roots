defmodule RootsWeb.Resolvers.RecipeResolver do
  alias Roots.{Repo, Recipe, Ingredient}
  alias Ecto.Multi

  def create_recipe(_parent, args, _resolution) do
    Multi.new()
    |> Multi.insert(:recipe, Recipe.create(args))
    |> Multi.merge(fn %{recipe: recipe} ->
      # That is the inserted user from the first part of the multi
      Multi.new()
      |> Multi.insert_all(:ingredients, Ingredient.create_all_ingredients(recipe))
    end)
    |> Repo.transaction()
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
