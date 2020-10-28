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
end
