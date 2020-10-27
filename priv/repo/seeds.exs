# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Roots.Repo.insert!(%Roots.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Roots.Repo

user_data = [
  %{
    name: "Ryan",
    email: "ryan@roots.com"
  },
  %{
    name: "Neeru",
    email: "neeru@roots.com"
  },
  %{
    name: "michaelAlex",
    email: "michaelAlex@roots.com"
  },
  %{
    name: "Jesseye",
    email: "jesseye@roots.com"
  },
  %{
    name: "Tyler",
    email: "tyler@roots.com"
  },
  %{
    name: "Horacio",
    email: "horacio@roots.com"
  }
]

Enum.each(user_data, fn(data) ->
  Repo.insert!(%Roots.User{name: data.name, email: data.email})
end)

user = Repo.insert!(%Roots.User{name: "User", email: "user@roots.com"})

Repo.insert!(%Roots.Cookbook{title: "My Cookbook", author: "Ryan", user: user})
