defmodule Roots.UserTest do
  use RootsWeb.ConnCase

  alias Roots.User
  alias Roots.Repo


  @valid_attrs %{name: "User Name", email: "user@roots.com"}

  describe "#create" do
    test "can create a new user" do
      {:ok, user} = User.create(@valid_attrs)
      assert user.name == "User Name"
      assert user.email == "user@roots.com"
    end
  end

  describe "#find" do
    test "finds user" do
      user = Repo.insert!(%Roots.User{name: "User", email: "user@roots.com"})
      found = User.find(user.id)
      assert found.id == user.id
      assert found.name == user.name
      assert found.email == user.email
    end
  end
end
