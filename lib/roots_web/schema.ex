defmodule Roots.Schema do
  use Absinth.Schema

  import_types(Absinth.Type.Custom)

  import_types(RootsWeb.Schema.UserTypes)
  # ...other models' types added here

  query do
    import_fields(:user_queries)
    # ... other models' queries added here
  end

  mutation do
    import_fields(:user_mutations)
    # ... other models' mutations added here
  end
end
