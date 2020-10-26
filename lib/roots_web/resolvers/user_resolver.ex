defmodule RootsWeb.Resolvers.UserResolver do
  alias Roots.User

  def createUser(_parent, args, _resolutions) do
    args
    |> User.create()
    |> case do
      {:ok, user} ->
      {:error, 'Unable to create new user'}
        # {:error, extract_error_msg(changeset)}
    end
  end
end
