defmodule RootsWeb.Router do
  use Phoenix.Router

  pipeline :api do
    plug RootsWeb.Context
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :api
    # PIPELINE ?
    forward "/graphiql", Absinthe.Plug.GraphiQL, schema: RootsWeb.Schema
    # PIPELINE ?
    forward "/", Absinthe.Plug, schema: RootsWeb.Schema
  end
end
