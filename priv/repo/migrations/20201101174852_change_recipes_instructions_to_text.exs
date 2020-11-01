defmodule Roots.Repo.Migrations.ChangeRecipesInstructionsToText do
  use Ecto.Migration

  def change do
    alter table(:recipes) do
      modify :instructions, :text
    end
  end
end
