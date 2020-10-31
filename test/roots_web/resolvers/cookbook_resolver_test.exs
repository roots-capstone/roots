defmodule RootsWeb.CookbookResolverTest do
  use RootsWeb.ConnCase
  require IEx

  alias RootsWeb.Resolvers.CookbookResolver
  alias Roots.{Repo, User, Cookbook}

  describe "#list" do
    test "returns cookbook" do
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

      {:ok, results} = CookbookResolver.list(nil, nil, nil)
      assert length(results) == 2
      assert List.first(results).id == persianFood.id
      assert List.last(results).id == usersCookbook.id
    end
  end

  describe "#show" do
    test "returns specific cookbook" do
      user =
        Repo.insert!(%User{
          name: "User",
          email: "user@roots.com"
        })

      persianFood =
        Repo.insert!(%Cookbook{
          title: "Persion Food",
          author: "Author Name",
          user_id: user.id
        })

      {:ok, found} = CookbookResolver.show(nil, %{id: persianFood.id}, nil)
      assert found.id == persianFood.id
      assert found.user_id == user.id
    end
  end

  describe "#create" do
    test "it creates a valid cookbook" do
      user =
        Repo.insert!(%User{
          name: "User",
          email: "user@roots.com"
        })

      args = %{title: "My cookbook", author: "User's Name", user_id: user.id}
      {:ok, cookbook} =
        CookbookResolver.create_cookbook(nil, args, nil)
      assert cookbook.title == args.title
      assert cookbook.author == args.author
      assert cookbook.user_id == user.id
    end
  end
end
