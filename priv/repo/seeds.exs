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
