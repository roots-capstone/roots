defmodule Roots.Repo.Migrations.AddIngredientToRecipe do
  use Ecto.Migration

  def change do
    alter table(:ingredients) do
      add :recipe_id, references(:recipes)
    end
  end
end
