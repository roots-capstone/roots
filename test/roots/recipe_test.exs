defmodule Roots.RecipeTest do
  use RootsWeb.ConnCase
  require IEx

  alias Roots.Recipe
  alias Roots.Repo


  describe "#create" do
    test "it can create a new recipe" do
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
      valid_attrs = %{
        title: "Recipe Name",
        author: "User Name",
        description: "Recipe description",
        instructions: "Recipe instructions",
        cookbook_id: usersCookbook.id
      }

      {:ok, recipe} = Recipe.create(valid_attrs)
      assert recipe.title == "Recipe Name"
      assert recipe.author == "User Name"
      assert recipe.cookbook_id == usersCookbook.id
    end
  end

  describe "#all" do
    test "it finds all recipes" do
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
      usersCookbook2 =
        Repo.insert!(%Roots.Cookbook{
          title: "User's Cookbook",
          author: "Author Name",
          user_id: user.id
        })
      beef_potato_stew =
        Repo.insert!(%Roots.Recipe{
           description: "A hearty beef anmd potato stew",
           instructions: "Cook in a crockpot",
           title: "Campfire Stew",
           author: "User Name",
           cookbook_id: usersCookbook.id
        })
      french_dish =
        Repo.insert!(%Roots.Recipe{
           description: "A classic French dish",
           instructions: "Cook the beef and carrots in red wine",
           title: "Beef Bourguinon",
           author: "User Name",
           cookbook_id: usersCookbook2.id
        })

      results = Recipe.all()
      assert length(results) == 2
      assert List.first(results).id == french_dish.id
      assert List.last(results).id == beef_potato_stew.id
    end
  end

  describe "#find" do
    test "it can find a cookbook by id" do
      user =
        Repo.insert!(%Roots.User{
          name: "User",
          email: "user@roots.com"
        })
      usersCookbook =
        Repo.insert!(%Roots.Cookbook{
          title: "User's Cookbook",
          author: "Author Name",
          user: user
        })
      beef_potato_stew =
        Repo.insert!(%Roots.Recipe{
           description: "A hearty beef anmd potato stew",
           instructions: "Cook in a crockpot",
           title: "Campfire Stew",
           author: "User Name",
           cookbook_id: usersCookbook.id
        })

      recipe_found = Recipe.find(beef_potato_stew.id)
      assert recipe_found.title == beef_potato_stew.title
      assert recipe_found.author == beef_potato_stew.author
      assert recipe_found.description == beef_potato_stew.description
    end
  end
end
