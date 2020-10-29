defmodule Roots.User do
  use Roots.Model

  alias Roots.{Repo, User, Cookbook}

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

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email])
    |> validate_required([:name, :email])
    |> unique_constraint(:email)
  end
end
