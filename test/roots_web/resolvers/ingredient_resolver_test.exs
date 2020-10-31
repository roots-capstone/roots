defmodule RootsWeb.IngredientResolverTest do
  use RootsWeb.ConnCase
  require IEx

  alias RootsWeb.Resolvers.IngredientResolver
  alias Roots.Repo

  describe "#create" do
    test "it creates an ingredient on a recipe" do
      user =
        Repo.insert!(%Roots.User{
          name: "User",
          email: "user@roots.com"
        })
      usersCookbook =
        Repo.insert!(%Roots.Cookbook{
          title: "User's Cookbook",
          author: "Author Name",
          user_id: user.id
      })
      recipe =
        Repo.insert!(%Roots.Recipe{
          title: "Chicken Salad",
          description: "Really tasty",
          instructions: "step 1, step 2",
          author: "Authors Name",
          cookbook_id: usersCookbook.id
      })

      args = %{
        recipe_id: recipe.id,
        name: "Chicken",
        amount: 0.5,
        unit: "lb"
      }
      {:ok, ingredient} =
        IngredientResolver.create_ingredient(nil, args, nil)
      assert ingredient.name == args.name
      assert ingredient.amount == 0.5
      assert ingredient.unit == args.unit
      assert ingredient.recipe_id == recipe.id
    end
  end
end
