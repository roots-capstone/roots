defmodule RootsWeb.Integration.CookbookResolverTest do
  use RootsWeb.ConnCase
  alias Roots.AbsintheHelpers
  alias Roots.{Repo, User, Cookbook}
  require IEx


  describe "#list" do
    test "it returns cookbooks" do
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

      persianFood =
        Repo.insert!(%Cookbook{
          title: "Persion Food",
          author: "Author Name",
          user_id: user.id
        })

      query = """
      {
        getCookbooks {
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
      """

      res =
        build_conn()
        |> post("/graphql", AbsintheHelpers.query_skeleton(query, "getCookbooks"))

      cookbooks = json_response(res, 200)["data"]["getCookbooks"]
      assert List.first(cookbooks)["id"] == to_string(persianFood.id)
      assert List.last(cookbooks)["id"] == to_string(usersCookbook.id)
    end
  end

  describe "#show" do
    test "it returns specific cookbook" do
      user =
        Repo.insert!(%User{
          name: "User",
          email: "user@roots.com"
        })

      persianFood =
        Repo.insert!(%Cookbook{
          title: "Persion Food",
          author: "Author Name",
          user: user
        })

      query = """
      {
        getCookbook(id: #{persianFood.id}) {
          id
          title
          author
        }
      }
      """

      res =
        build_conn()
        |> post("/graphql", AbsintheHelpers.query_skeleton(query, "getCookbook"))

      cookbook_found = json_response(res, 200)["data"]["getCookbook"]
      assert cookbook_found["id"] == to_string(persianFood.id)
    end
  end

  describe "#create" do
    test "it can create a cookbook" do
      user =
        Repo.insert!(%User{
          name: "User",
          email: "user@roots.com"
        })

      mutation = """
      {
        createCookbook(title: "New Cookbook", author: "User's Name", user_id: #{user.id}) {
          title
          author
          user {
            id
            name
          }
        }
      }
      """

      res =
        build_conn()
        |> post("/graphql", AbsintheHelpers.mutation_skeleton(mutation))

      new_cookbook = json_response(res, 200)["data"]["createCookbook"]

      assert new_cookbook["title"] == "New Cookbook"
      assert new_cookbook["author"] == "User's Name"
      assert new_cookbook["user"]["id"] == Integer.to_string(user.id)
      assert new_cookbook["user"]["name"] == user.name
    end
  end
end
