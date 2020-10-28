defmodule RootsWeb.Integration.CookbookResolverTest do
  use RootsWeb.ConnCase
  alias Roots.AbsintheHelpers
  alias Roots.Repo
  require IEx

  describe "#list" do
    test "it returns cookbooks" do
      user = Repo.insert!(%Roots.User{
        name: "User",
        email: "user@roots.com"
      })
      usersCookbook = Repo.insert!(%Roots.Cookbook{
        title: "User's Cookbook",
        author: "Author Name",
        user: user
      })
      persianFood = Repo.insert!(%Roots.Cookbook{
        title: "Persion Food",
        author: "Author Name",
        user: user
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
      user = Repo.insert!(%Roots.User{
        name: "User",
        email: "user@roots.com"
      })
      persianFood = Repo.insert!(%Roots.Cookbook{
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
    test "it can create a cookbook (without a user)" do
      mutation = """
      {
        createCookbook(title: "New Cookbook", author: "User's Name") {
          title
          author
        }
      }
      """

      res =
        build_conn()
        |> post("/graphql", AbsintheHelpers.mutation_skeleton(mutation))

      new_cookbook = json_response(res, 200)["data"]["createCookbook"]
      IEx.pry
      assert new_cookbook["title"] == "New Cookbook"
      assert new_cookbook["author"] == "User's Name"
    end
  end
end
