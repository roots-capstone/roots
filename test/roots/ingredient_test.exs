defmodule Roots.IngredientTest do
  use RootsWeb.ConnCase
  require IEx

  alias Roots.Ingredient
  alias Roots.{Repo, User, Cookbook, Recipe, Ingredient}


  describe "#create" do
    test "it can create a new ingredient" do
      user =
        Repo.insert!(%User{
          name: "User",
          email: "user@roots.com"
        })
      usersCookbook =
        Repo.insert!(%Cookbook{
          title: "User's Cookbook",
          author: "Author Name",
          user_id: user.id
        })
      recipe =
        Repo.insert!(%Recipe{
          title: "User's Recipe",
          author: "Author Name",
          description: "Recipe description",
          instructions: "Recipe instructions",
          cookbook_id: usersCookbook.id
        })
      valid_attrs = %{
        name: "Ingredient Name",
        amount: 20.0,
        unit: "Ingredient unit",
        recipe_id: recipe.id
      }

      {:ok, ingredient} = Ingredient.create(valid_attrs)
      assert ingredient.name == valid_attrs.name
      assert ingredient.amount == valid_attrs.amount
      assert ingredient.unit == valid_attrs.unit
      assert ingredient.recipe_id == recipe.id
    end
  end

  describe "#all" do
    test "it finds all recipes" do
      user =
        Repo.insert!(%User{
          name: "User",
          email: "user@roots.com"
        })
      usersCookbook =
        Repo.insert!(%Cookbook{
          title: "User's Cookbook",
          author: "Author Name",
          user_id: user.id
        })
      recipe =
        Repo.insert!(%Recipe{
           description: "A hearty beef anmd potato stew",
           instructions: "Cook in a crockpot",
           title: "Campfire Stew",
           author: "User Name",
           cookbook_id: usersCookbook.id
        })
      ingredient1 =
        Repo.insert!(%Ingredient{
           name: "Ingredient name",
           amount: 2.0,
           unit: "oz",
           recipe_id: recipe.id
        })
      ingredient2 =
        Repo.insert!(%Ingredient{
           name: "Ingredient name",
           amount: 2.0,
           unit: "oz",
           recipe_id: recipe.id
        })

      results = Ingredient.all()
      assert length(results) == 2
      assert List.first(results).id == ingredient2.id
      assert List.last(results).id == ingredient1.id
    end
  end

  describe "#find" do
    test "it can find a cookbook by id" do
      user =
        Repo.insert!(%User{
          name: "User",
          email: "user@roots.com"
        })
      usersCookbook =
        Repo.insert!(%Cookbook{
          title: "User's Cookbook",
          author: "Author Name",
          user_id: user.id
        })
      recipe =
        Repo.insert!(%Recipe{
           description: "A hearty beef anmd potato stew",
           instructions: "Cook in a crockpot",
           title: "Campfire Stew",
           author: "User Name",
           cookbook_id: usersCookbook.id
        })
      ingredient =
        Repo.insert!(%Ingredient{
           name: "Ingredient name",
           amount: 2.0,
           unit: "oz",
           recipe_id: recipe.id
        })

      ingredient_found = Ingredient.find(ingredient.id)
      assert ingredient_found.name == ingredient.name
      assert ingredient_found.amount == ingredient.amount
      assert ingredient_found.unit == ingredient.unit
      assert ingredient_found.recipe_id == ingredient.recipe_id
    end
  end
end
