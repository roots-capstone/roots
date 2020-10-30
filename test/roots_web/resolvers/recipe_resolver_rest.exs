defmodule RootsWeb.RecipeResolverTest do
  use RootsWeb.ConnCase
  require IEx

  alias RootsWeb.Resolvers.RecipeResolver
  alias Roots.Repo

  describe "#create" do
    test "it creates a valid recipe" do
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

      args = %{
        title: "New recipe",
        author: "User Name",
        description: "Recipe's description",
        instructions: "Recipe's instructions",
        cookbook_id: usersCookbook.id
      }
      {:ok, recipe} =
        RecipeResolver.create_recipe(nil, args, nil)
      assert recipe.title == args.title
      assert recipe.author == args.author
      assert recipe.description == args.description
      assert recipe.instructions == args.instructions
      assert recipe.cookbook_id == usersCookbook.id
    end
  end

  describe "#list" do
    test "it can return a list of recipes" do
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
      beef_potato_stew =
        Repo.insert!(%Roots.Recipe{
           description: "A hearty beef anmd potato stew",
           instructions: "Cook in a crockpot",
           title: "Campfire Stew",
           author: "User Name",
           cookbook_id: usersCookbook.id
        })
      baked_chicken =
        Repo.insert!(%Roots.Recipe{
           description: "Lemon=garlic baked chicken cooked with potatoes",
           instructions: "Bake at 375F",
           title: "Greek Chicken and Potatoes",
           author: "User Name",
           cookbook_id: usersCookbook.id
        })
      french_dish =
        Repo.insert!(%Roots.Recipe{
           description: "A classic French dish",
           instructions: "Cook the beef and carrots in red wine",
           title: "Beef Bourguinon",
           author: "User Name",
           cookbook_id: usersCookbook.id
        })

      {:ok, results} = RecipeResolver.list(nil, nil, nil)
      assert length(results) == 3
      assert List.first(results).id == french_dish.id
      assert List.last(results).id == beef_potato_stew.id
    end
  end

  describe "#show" do
    test "it can return a specific recipe" do
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
      beef_potato_stew =
        Repo.insert!(%Roots.Recipe{
           description: "A hearty beef anmd potato stew",
           instructions: "Cook in a crockpot",
           title: "Campfire Stew",
           author: "User Name",
           cookbook_id: usersCookbook.id
        })

      {:ok, found} = RecipeResolver.show(nil, %{id: beef_potato_stew.id}, nil)
      assert found.id == beef_potato_stew.id
      assert found.cookbook_id == usersCookbook.id
    end
  end
end
