defmodule Roots.User do
  use Roots.Model

  alias Roots.{Cookbook}


  schema "users" do
    field :email, :string
    field :name, :string

    has_many :cookbooks, Cookbook

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email])
    |> validate_required([:name, :email])
    |> unique_constraint(:email)
  end
end
