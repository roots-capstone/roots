defmodule RootsWeb.Integration.RecipeResolverTest do
  use RootsWeb.ConnCase
  alias Roots.AbsintheHelpers
  alias Roots.Repo
  require IEx


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
end
