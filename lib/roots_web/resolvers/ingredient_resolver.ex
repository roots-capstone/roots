defmodule RootsWeb.Resolvers.IngredientResolver do
  alias Roots.Ingredient

  def create_ingredient(_parent, args, _resolution) do
    IO.inspect(Ingredient.create(args), label: "potato")
    args
    |> Ingredient.create()
    |> case do
      {:ok, ingredient} ->
        {:ok, ingredient}
        _error ->
        {:error, "Could not create ingredient"}
    end
  end
end
