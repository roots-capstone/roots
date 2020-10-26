defmodule Roots.User do
  use Roots.Model

  alias Roots.{Repo, Cookbook}


  schema "users" do
    field :email, :string
    field :name, :string
    has_many :cookbooks, Cookbook

    timestamps()
  end

  def search(serach_term, current_user) do
    Repo.all(
      from u in __MODULE__,
        where: ilike(u.name, ^("%" <> serach_term <> "%")) and u.id != ^current_user.id,
        limit: 25
    )
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email])
    |> validate_required([:name, :email])
    |> unique_constraint(:email)
  end
end
