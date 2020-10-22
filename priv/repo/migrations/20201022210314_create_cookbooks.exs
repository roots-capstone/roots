defmodule Roots.Repo.Migrations.CreateCookbooks do
  use Ecto.Migration

  def change do
    create table(:cookbooks) do
      add :title, :string
      add :author, :string
    end
  end
end
