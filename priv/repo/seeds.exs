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

# USERS
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

# COOKBOOKS
neerus_cookbook = Repo.insert!(%Roots.Cookbook{
  title: "Neeru's Cookbook",
  author: "Neeru",
  user: neeru
})
indian_food = Repo.insert!(%Roots.Cookbook{
  title: "Indian Food",
  author: "Neeru",
  user: neeru
})
ryans_cookbook = Repo.insert!(%Roots.Cookbook{
  title: "Ryan's Cookbook",
  author: "Ryan",
  user: ryan
})
michael_alexs_cookbook = Repo.insert!(%Roots.Cookbook{
  title: "MichaelAlex's Cookbook",
  author: "MichaelAlex",
  user: michaelAlex
})
jessyes_cookbook = Repo.insert!(%Roots.Cookbook{
  title: "Jessye's Cookbook",
  author: "Jessye",
  user: jessye
})
tylers_cookbook = Repo.insert!(%Roots.Cookbook{
  title: "Tyler's Cookbook",
  author: "Tyler",
  user: tyler
})
horacios_cookbook = Repo.insert!(%Roots.Cookbook{
  title: "Horacio's Cookbook",
  author: "Horacio",
  user: horacio
})


# RECIPES
beed_potato_stew = Repo.insert!(%Roots.Recipe{
   description: "A hearty beef anmd potato stew",
   instructions: "Cook in a crockpot",
   title: "Campfire Stew",
   author: "Michael Alex",
   cookbook: michael_alexs_cookbook
})
baked_chicken = Repo.insert!(%Roots.Recipe{
   description: "Lemon=garlic baked chicken cooked with potatoes",
   instructions: "Bake at 375F",
   title: "Greek Chicken and Potatoes",
   author: "Michael Alex",
   cookbook: michael_alexs_cookbook
})
french_dish = Repo.insert!(%Roots.Recipe{
   description: "A classic French dish",
   instructions: "Cook the beef and carrots in red wine",
   title: "Beef Bourguinon",
   author: "Michael Alex",
   cookbook: michael_alexs_cookbook
})
