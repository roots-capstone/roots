defmodule Roots.CookbookTest do
  use RootsWeb.ConnCase
  require IEx

  alias Roots.Cookbook
  alias Roots.Repo

  @valid_attrs %{title: "Cookbook Name", author: "User Name"}

  describe "#create" do
    test "it can create a new cookbook" do
      {:ok, cookbook} = Cookbook.create(@valid_attrs)
      assert cookbook.title == "Cookbook Name"
      assert cookbook.author == "User Name"
    end
  end

  describe "#all" do
    test "it finds all cookbooks" do
      user =
        Repo.insert!(%Roots.User{
          name: "User",
          email: "user@roots.com"
        })

      usersCookbook =
        Repo.insert!(%Roots.Cookbook{
          title: "User's Cookbook",
          author: "Author Name",
          user: user
        })

      persianFood =
        Repo.insert!(%Roots.Cookbook{
          title: "Persion Food",
          author: "Author Name",
          user: user
        })

      results = Cookbook.all()
      assert length(results) == 2
      assert List.first(results).id == persianFood.id
      assert List.last(results).id == usersCookbook.id
    end
  end

  describe "#find" do
    test "it can find a cookbook by id" do
      user =
        Repo.insert!(%Roots.User{
          name: "User",
          email: "user@roots.com"
        })

      usersCookbook =
        Repo.insert!(%Roots.Cookbook{
          title: "User's Cookbook",
          author: "Author Name",
          user: user
        })

      cookbook_found = Cookbook.find(usersCookbook.id)
      assert cookbook_found.title == "User's Cookbook"
      assert cookbook_found.author == "Author Name"
    end
  end
end
