defmodule RootsWeb.UserResolverTest do
  use RootsWeb.ConnCase
  require IEx

  alias RootsWeb.Resolvers.UserResolver
  alias Roots.Repo

  describe "#show" do
    test "returns specific user" do
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

      {:ok, found} = UserResolver.show(nil, %{id: neeru.id}, nil)
      assert found.id == neeru.id
      assert found.name == neeru.name
      assert found.email == neeru.email
    end
  end
end
