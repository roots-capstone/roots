defmodule RootsWeb.Integration.UserResolverTest do
  use RootsWeb.ConnCase
  alias Roots.AbsintheHelpers
  alias Roots.Repo
  require IEx

  describe "#show" do
    test "it returns specific user" do
      neeru =
        Repo.insert!(%Roots.User{
          name: "Neeru",
          email: "neeru@roots.com"
        })

      persianFood =
        Repo.insert!(%Roots.Cookbook{
          title: "Persion Food",
          author: "Author Name",
          user: neeru
        })

      query = """
      {
        getUser(id: #{neeru.id}) {
          id
          name
          email
        }
      }
      """

      res =
        build_conn()
        |> post("/graphql", AbsintheHelpers.query_skeleton(query, "getUser"))

      user_found = json_response(res, 200)["data"]["getUser"]
      assert user_found["id"] == to_string(neeru.id)
    end
  end

  describe "#create" do
    test "it can create a user" do
      user =
        Repo.insert!(%Roots.User{
          name: "User",
          email: "user@roots.com"
        })

      mutation = """
      {
        createuser(name: "Neeru", email: "neeram@roots.com" {
          name
          email
        }
      }
      """

      res =
        build_conn()
        |> post("/graphql", AbsintheHelpers.mutation_skeleton(mutation))

      new_user = json_response(res, 200)["data"]["createUser"]
      assert new_user["name"] == "Neeru"
      assert new_user["email"] == "neeram@roots.com"
    end
  end
end
