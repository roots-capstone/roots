defmodule RootsWeb.Integration.IngredientResolverTest do
  use RootsWeb.ConnCase
  alias Roots.AbsintheHelpers
  alias Roots.{Repo, User, Cookbook, Recipe}
  require IEx

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
          title: "Chicken Salad",
          description: "Really tasty",
          instructions: "step 1, step 2",
          author: "Authors Name",
          cookbook_id: usersCookbook.id
        })

      mutation = """
      {
        createIngredient(
          name: "New ingredient",
          amount: "4",
          unit: "oz",
          recipe_id: #{recipe.id}) {
            name
            amount
            unit
            recipe {
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
      }
      """

      res =
        build_conn()
        |> post("/graphql", AbsintheHelpers.mutation_skeleton(mutation))

      new_ingredient = json_response(res, 200)["data"]["createIngredient"]
      assert new_ingredient["name"] == "New ingredient"
      assert new_ingredient["amount"] == "4"
      assert new_ingredient["unit"] == "oz"
      assert new_ingredient["recipe"]["id"] == Integer.to_string(recipe.id)
      assert new_ingredient["recipe"]["title"] == "Chicken Salad"
      assert new_ingredient["recipe"]["cookbook"]["id"] == Integer.to_string(usersCookbook.id)
      assert new_ingredient["recipe"]["cookbook"]["user"]["id"] == Integer.to_string(user.id)
    end
  end
end
