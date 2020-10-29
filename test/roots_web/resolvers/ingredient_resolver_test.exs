defmodule RootsWeb.IngredientResolverTest do
  use RootsWeb.ConnCase
  require IEx

  alias RootsWeb.Resolvers.IngredientResolver
  alias Roots.Repo

  describe "#create" do
    test "it creates an ingredient on a recipe" do
      usersCookbook =
        Repo.insert!(%Roots.Cookbook{
          title: "User's Cookbook",
          author: "Author Name",
      })
      recipe_1 =
        Repo.insert!(%Roots.Recipe{
          title: "Chicken Salad",
          description: "Really tasty",
          instructions: "step 1, step 2",
          author: "Authors Name",
          cookbook_id: usersCookbook.id
      })

      {:ok, ingredient} =
        IngredientResolver.create_ingredient(
          nil,%{
            recipe_id: recipe_1.id,
            name: "Chicken",
            amount: 0.5,
            unit: "lb"},
          nil
        )

      assert ingredient.name == "Chicken"
      assert ingredient.amount == 0.5
      assert ingredient.unit == "lb"
      assert ingredient.recipe_id == recipe_1.id
    end
  end
end
