defmodule Roots.Repo.Migrations.AddUserToCookbooks do
  use Ecto.Migration

  def change do
    alter table(:cookbooks) do
      add :user_id, references(:users)
    end
  end
end
