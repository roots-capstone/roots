defmodule RootsWeb.Resolvers.UserResolver do
  alias Roots.User

  def create_user(_parent, args, _resolution) do
    case User.create(args) do
      {:ok, user} ->
        {:ok, user}

      _error ->
        {:error, "Could not create user"}
    end
  end

  def cookbook_list(_parent, args, _resolution) do
    case User.find(args[:id]) do
      nil -> {:error, "Not found"}
      user -> {:ok, User.cookbooks()}
    end
  end
end
