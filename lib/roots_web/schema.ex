defmodule Roots.Schema do
  use Absinthe.Schema
  import_types(Absinthe.Type.Custom)

  import_types(RootsWeb.Schema.UserType)
  import_types(RootsWeb.Schema.CookbookType)
  import_types(RootsWeb.Schema.RecipeType)
  import_types(RootsWeb.Schema.IngredientType)

  query do
    import_fields(:user_queries, :cookbook_queries, :recipe_queries, :ingredient_queries)
  end

  mutation do
    import_fields(:user_mutations, :cookbook_mutations, :recipe_mutations, :ingredient_mutations)
  end
end
