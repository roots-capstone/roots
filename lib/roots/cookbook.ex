defmodule Roots.Cookbook do
  use Roots.Model

  alias Roots.{Repo}


  schema "cookbooks" do
    field :author, :string
    field :title, :string

    belongs_to :user, Roots.User
    has_many :recipes, Roots.Recipe

    timestamps()
  end

  def all do
    Repo.all(from row in __MODULE__, order_by: [desc: row.id])
  end

  def changeset(cookbook, attrs) do
    cookbook
    |> cast(attrs, [:title, :author])
    |> validate_required([:title, :author])
  end
end
