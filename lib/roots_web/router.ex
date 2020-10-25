defmodule RootsWeb.Router do
  use Phoenix.Router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :api

    forward "/graphiql", Absinthe.Plug.GraphiQL, schema: RootsWeb.Schema

    forward "/", Absinthe.Plug,
      schema: RootsWeb.Schema,
      context: %{pubsub: Roots.Web.Endpoint}
  end
end
