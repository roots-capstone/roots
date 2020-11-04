defmodule Roots.Repo.Migrations.Changeamounttostring do
  use Ecto.Migration

  def change do
    alter table(:ingredients) do
      modify :amount, :string
    end
  end
end
