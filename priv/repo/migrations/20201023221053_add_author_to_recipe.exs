defmodule Roots.Repo.Migrations.AddAuthorToRecipe do
  use Ecto.Migration

  def change do
    alter table(:recipes) do
      add :author, :string
    end
  end
end
