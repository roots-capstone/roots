defmodule RootsWeb.Context do
  @behaviour Plug

  import Plug.Conn

  alias Roots.User

  def init(opts), do: opts

  def call(conn, _) do
    context = build_context(conn)
    Absinthe.Plug.put_options(conn, context: context)
  end

  def build_context(conn) do
    with ["Bearer " <> token] <- get_req_header(conn, "authorization"),
        {:ok, claim} <- Gaurdian.decode_and_verify(token),
        user when not is_nil(user) <- User.find(claim["sub"]) do
      %{current_user: user}
    else
      _ -> %{}
    end
  end
end
