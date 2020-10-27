defmodule Roots.UserTest do
  use Roots.ConnCase

  alias Roots.User


  @valid_attrs %{name: "User Name", email: "user@roots.com"}

  describe "#create" do
    it "can create a new user" do
      {:ok, user} = User.create(@valid_attrs)
      assert user.name == "User Name 1"
    end
  end

  describe "#find" do
    it "finds user" do
      user = insert(:user, name: "User Name 2")
      found = User.find(user.id)
      assert found.id == user.id
    end
  end

  describe "#changeset" do
    it "valitdates with correct attributes" do
      changeset = User.changeset(%User{}, @valid_attrs)
      assert changeset.valid?
    end

    it "does not valitdate with invalid email format" do
      changeset =
        User.changeset(
          %User{},
          Map.put(@valid_attrs, :email, "invalid_email@roots.com")
        )

      refute changeset.valid?
    end
  end
end
