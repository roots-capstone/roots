defmodule Roots.Repo.Migrations.CreateIngredients do
  use Ecto.Migration

  def change do
    create table(:ingredients) do
      add :name, :string
      add :amount, :float
      add :unit, :string

      timestamps()
    end
  end
end
