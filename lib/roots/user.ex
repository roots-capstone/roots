defmodule Roots.User do
  use Roots.Model

  alias Roots.{Repo, User, Cookbook, Recipe}

  schema "users" do
    field :email, :string
    field :name, :string

    has_many :cookbooks, Cookbook

    timestamps()
  end

  def get_cookbooks(id) do
    query =
      from c in Cookbook,
        where: c.user_id == ^id,
        preload: :user

    Repo.all(query)
  end

  def get_user(id) do
    user =
      Roots.Repo.one(
        from user in Roots.User,
          where: user.id == ^id,
          left_join: cookbook in assoc(user, :cookbook),
          left_join: recipes in assoc(cookbook, :recipes),
          left_join: ingredients in assoc(recipes, :ingredients),
          preload: [
            cookbook: {cookbook, recipes: recipes},
            recipe: {recipes, ingredients: ingredients}
          ]
      )

    Roots.Repo.one()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email])
    |> validate_required([:name, :email])
    |> unique_constraint(:email)
  end
end
