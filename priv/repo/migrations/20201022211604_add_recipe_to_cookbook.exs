defmodule Roots.Repo.Migrations.AddRecipeToCookbook do
  use Ecto.Migration

  def change do
    alter table(:recipes) do
      add :cookbook_id, references(:cookbooks)
    end
  end
end
