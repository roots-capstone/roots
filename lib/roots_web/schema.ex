defmodule RootsWeb.Schema do
  use Absinthe.Schema
  import_types(Absinthe.Type.Custom)

  import_types(RootsWeb.Schema.UserTypes)
  import_types(RootsWeb.Schema.CookbookTypes)
  import_types(RootsWeb.Schema.RecipeTypes)
  import_types(RootsWeb.Schema.IngredientTypes)

  query do
    import_fields(:user_queries, :cookbook_queries, :recipe_queries, :ingredient_queries)
  end

  mutation do
    import_fields(:user_mutations, :cookbook_mutations, :recipe_mutations, :ingredient_mutations)
  end
end
