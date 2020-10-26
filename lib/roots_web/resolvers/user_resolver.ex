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
end
