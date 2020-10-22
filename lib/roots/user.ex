defmodule Roots.User do
  use Ecto.Schema

  schema "user" do
    field :name, :string
    field :email, :string
    has_many :cookbooks, User.Cookboks
  end
end
