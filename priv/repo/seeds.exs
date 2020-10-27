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

ryan = Repo.insert!(%Roots.User{name: "Ryan", email: "user_ryan@roots.com"})

cookbook_data = [
  %{
    title: "Ryan's Cookbook",
    author: "ryan@roots.com",
    user: ryan
  },
  %{
    title: "Persian Food",
    author: "Ryan Laleh",
    user: ryan
  },
  %{
    title: "Mexican Food",
    author: "Ryan Laleh",
    user: ryan
  },
  %{
    title: "Japanese Food",
    author: "Ryan Laleh",
    user: ryan
  },
  %{
    title: "My Favorite Food",
    author: "Ryan Laleh",
    user: ryan
  }
]

Enum.each(cookbook_data, fn(data) ->
  Repo.insert!(%Roots.Cookbook{title: data.title, author: data.author, user: data.user})
end)
