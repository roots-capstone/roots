defmodule RootsWeb.Resolvers.CookbookResolver do
  alias Roots.Cookbook

  def list(_parent, _args, _resolutions) do
    {:ok, Cookbook.all()}
  end

  def show(_parent, args, _resolutions) do
    case Cookbook.find(args[:id]) do
      nil -> {:error, "Cookbook not found"}
      cookbook -> {:ok, cookbook}
    end
  end

  def create_cookbook(_parent, args, _resolutions) do
    args
    |> Cookbook.create()
    |> case do
      {:ok, cookbook} ->
        {:ok, cookbook}

      _error ->
        {:error, "Could not create cookbook"}
    end
  end
end
