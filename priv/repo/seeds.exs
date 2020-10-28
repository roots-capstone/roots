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

## TO CLEAR OUT THE DATABASE SO THERE ARE NO DUPLICATES
## AND THEN SEED THE DATABASE
## RUN  $ mix ecto.reset

alias Roots.Repo
alias Repo.{User, Cookbook}

user_data = [
  %{
    name: "michaelAlex",
    email: "michaelAlex@roots.com"
  },
  %{
    name: "Jessye",
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

Enum.each(user_data, fn data ->
  Repo.insert!(%Roots.User{name: data.name, email: data.email})
end)

ryan = Repo.insert!(%Roots.User{
  name: "Ryan",
  email: "ryan@roots.com"
})
neeru = Repo.insert!(%Roots.User{
  name: "Neeru",
  email: "neeru@roots.com"
})
michaelAlex = Repo.insert!(%Roots.User{
  name: "michaelAlex",
  email: "michaelAlex@roots.com"
})
jessye = Repo.insert!(%Roots.User{
  name: "Jessye",
  email: "jessye@roots.com"
})
tyler = Repo.insert!(%Roots.User{
  name: "Tyler",
  email: "tyler@roots.com"
})
horacio = Repo.insert!(%Roots.User{
  name: "Horacio",
  email: "horacio@roots.com"
})

Repo.insert!(%Roots.Cookbook{
  title: "Ryan's Cookbook",
  author: "Ryan",
  user: ryan
})
Repo.insert!(%Roots.Cookbook{
  title: "Neeru's Cookbook",
  author: "Neeru",
  user: neeru
})
Repo.insert!(%Roots.Cookbook{
  title: "MichaelAlex's Cookbook",
  author: "MichaelAlex",
  user: michaelAlex
})
Repo.insert!(%Roots.Cookbook{
  title: "Jessye's Cookbook",
  author: "Jessye",
  user: jessye
})
Repo.insert!(%Roots.Cookbook{
  title: "Tyler's Cookbook",
  author: "Tyler",
  user: tyler
})
Repo.insert!(%Roots.Cookbook{
  title: "Horacio's Cookbook",
  author: "Horacio",
  user: horacio
})

neeru = Repo.insert!(%Roots.User{name: "Neeru", email: "neeram85@gmail.com"})

cookbook_data = [
  %{
    title: "Ryan's Cookbook",
    author: "ryan@roots.com",
    user: ryan
  },
  %{
    title: "Neeru's Cookbook",
    author: "Neeru",
    user: neeru
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
  },
  %{
    title: "Indian Food",
    author: "Neeru",
    user: neeru
  }
]

Enum.each(cookbook_data, fn data ->
  Repo.insert!(%Roots.Cookbook{title: data.title, author: data.author, user: data.user})
end)
