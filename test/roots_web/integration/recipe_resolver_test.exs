defmodule RootsWeb.Integration.RecipeResolverTest do
  use RootsWeb.ConnCase
  alias Roots.AbsintheHelpers
  alias Roots.{Repo, User, Cookbook, Recipe}
  require IEx


  describe "#create" do
    test "it can create a new recipe" do
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

      mutation = """
      {
        createRecipe(
          title: "New Recipe",
          author: "User Name",
          description: "This and that",
          instructions: "Step 1 and step 2",
          cookbook_id: #{usersCookbook.id}) {
            title
            author
            description
            instructions
            id
            cookbook {
              id
              title
              author
            }
          }
      }
      """

      res =
        build_conn()
        |> post("/graphql", AbsintheHelpers.mutation_skeleton(mutation))

      new_recipe = json_response(res, 200)["data"]["createRecipe"]
      assert new_recipe["title"] == "New Recipe"
      assert new_recipe["author"] == "User Name"
      assert new_recipe["description"] == "This and that"
      assert new_recipe["instructions"] == "Step 1 and step 2"
      assert new_recipe["cookbook"]["id"] == Integer.to_string(usersCookbook.id)
      assert new_recipe["cookbook"]["title"] == usersCookbook.title
      assert new_recipe["cookbook"]["author"] == usersCookbook.author
    end
  end

  describe "#list" do
    test "it returns a list of recipes" do
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
      beef_potato_stew =
        Repo.insert!(%Recipe{
           description: "A hearty beef anmd potato stew",
           instructions: "Cook in a crockpot",
           title: "Campfire Stew",
           author: "User Name",
           cookbook_id: usersCookbook.id
        })
      french_dish =
        Repo.insert!(%Recipe{
           description: "A classic French dish",
           instructions: "Cook the beef and carrots in red wine",
           title: "Beef Bourguinon",
           author: "User Name",
           cookbook_id: usersCookbook.id
        })

      query = """
      {
        getRecipes {
          id
          title
          author
          description
          instructions
        }
      }
      """

      res =
        build_conn()
        |> post("/graphql", AbsintheHelpers.query_skeleton(query, "getRecipes"))

      recipes = json_response(res, 200)["data"]["getRecipes"]
      assert List.first(recipes)["id"] == to_string(french_dish.id)
      assert List.last(recipes)["id"] == to_string(beef_potato_stew.id)
    end
  end

  describe "#show" do
    test "it can return a recipe and the cookbook/user it belongs to" do
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
      beef_potato_stew =
        Repo.insert!(%Recipe{
           description: "A hearty beef anmd potato stew",
           instructions: "Cook in a crockpot",
           title: "Campfire Stew",
           author: "User Name",
           cookbook_id: usersCookbook.id
        })

      query = """
      {
        getRecipe(id: #{beef_potato_stew.id}) {
          id
          title
          author
          description
          instructions
          cookbook {
            id
            title
            author
            user {
              id
              name
              email
            }
          }
        }
      }
      """

      res =
        build_conn()
        |>post("/graphql", AbsintheHelpers.query_skeleton(query, "getRecipe"))

      recipe_found = json_response(res, 200)["data"]["getRecipe"]
      assert recipe_found["id"] == to_string(beef_potato_stew.id)
      assert recipe_found["cookbook"]["id"] == to_string(usersCookbook.id)
      assert recipe_found["cookbook"]["user"]["id"] == to_string(user.id)
    end
  end
end
