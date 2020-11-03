defmodule Roots.Recipe do
  use Roots.Model

  alias Roots.{Repo, Recipe}

  schema "recipes" do
    field :description, :string
    field :instructions, :string
    field :title, :string
    field :author, :string
    has_many :ingredients, Roots.Ingredient
    belongs_to :cookbook, Roots.Cookbook

    timestamps()
  end

  def all do
    Repo.all(from row in __MODULE__, order_by: [desc: row.id])
  end

  @doc false
  def changeset(recipe, attrs) do
    recipe
    |> cast(attrs, [:title, :description, :instructions, :author, :cookbook_id])
    |> validate_required([:title, :description, :instructions, :author, :cookbook_id])
    |> foreign_key_constraint(:cookbook_id)
    |> cast_assoc(:cookbook)
  end
end
