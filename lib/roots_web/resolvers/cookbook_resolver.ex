defmodule RootsWeb.Resolvers.CookbookResolver do
  alias Roots.Cookbook

  def list(_parent, _args, _resolutions) do
    {:ok, Cookbook.all()}
  end

  def show(_parent, args, _resolutions) do
    case Cookbook.find(args[:id]) do
      nil -> {:error, "Not found"}
      cookbook -> {:ok, cookbook}
    end
  end

  def create(_parent, args, %{
        context: %{current_user: current_user}
      }) do
    args
    |> Map.put(:user_id, current_user.id)
    |> Cookbook.create()
    |> case do
      {:ok, cookbook} ->
        {:ok, cookbook}

      {:error, changeset} ->
        {:error, extract_error_msg(changeset)}
    end
  end

  def create(_parent, _args, _resolutions) do
    {:error, "Unauthenticated"}
  end

  defp extract_error_msg(changeset) do
    changeset.errors
    |> Enum.map(fn {field, {error, _details}} ->
      [
        field: field,
        message: String.capitalize(error)
      ]
    end)
  end
end
