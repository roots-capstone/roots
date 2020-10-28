defmodule RootsWeb.CookbookResolverTest do
  use RootsWeb.ConnCase
  require IEx

  alias RootsWeb.Resolvers.CookbookResolver
  alias Roots.Repo

  describe "#list" do
    test "returns cookbook" do
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
      {:ok, results} = CookbookResolver.list(nil, nil, nil)
      assert length(results) == 2
      assert List.first(results).id == persianFood.id
      assert List.last(results).id == usersCookbook.id
    end
  end

  describe "#show" do
    test "returns specific cookbook" do
      user = Repo.insert!(%Roots.User{
        name: "User",
        email: "user@roots.com"
      })
      persianFood = Repo.insert!(%Roots.Cookbook{
        title: "Persion Food",
        author: "Author Name",
        user: user
      })
      {:ok, found} = CookbookResolver.show(nil, %{id: persianFood.id}, nil)
      assert found.id == persianFood.id
    end
  end
end
