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
  user_id: neeru.id
})
indian_food = Repo.insert!(%Roots.Cookbook{
  title: "Indian Food",
  author: "Neeru",
  user_id: neeru.id
})
ryans_cookbook = Repo.insert!(%Roots.Cookbook{
  title: "Ryan's Cookbook",
  author: "Ryan",
  user_id: ryan.id
})
michael_alexs_cookbook = Repo.insert!(%Roots.Cookbook{
  title: "MichaelAlex's Cookbook",
  author: "MichaelAlex",
  user_id: michaelAlex.id
})
jessyes_cookbook = Repo.insert!(%Roots.Cookbook{
  title: "Jessye's Cookbook",
  author: "Jessye",
  user_id: jessye.id
})
tylers_cookbook = Repo.insert!(%Roots.Cookbook{
  title: "Tyler's Cookbook",
  author: "Tyler",
  user_id: tyler.id
})
horacios_cookbook = Repo.insert!(%Roots.Cookbook{
  title: "Horacio's Cookbook",
  author: "Horacio",
  user_id: horacio.id
})


# RECIPES
beef_potato_stew = Repo.insert!(%Roots.Recipe{
   description: "A hearty beef anmd potato stew",
   instructions: "Cook in a crockpot",
   title: "Campfire Stew",
   author: "Michael Alex",
   cookbook_id: michael_alexs_cookbook.id
})
baked_chicken = Repo.insert!(%Roots.Recipe{
   description: "Lemon=garlic baked chicken cooked with potatoes",
   instructions: "Bake at 375F",
   title: "Greek Chicken and Potatoes",
   author: "Michael Alex",
   cookbook_id: michael_alexs_cookbook.id
})
french_dish = Repo.insert!(%Roots.Recipe{
   description: "A classic French dish",
   instructions: "Cook the beef and carrots in red wine",
   title: "Beef Bourguinon",
   author: "Michael Alex",
   cookbook_id: michael_alexs_cookbook.id
})

# INGREDIENTS
beef = Repo.insert!(%Roots.Ingredient{
  name: "beef",
  amount: 2.0,
  unit: "lbs",
  recipe_id: beef_potato_stew.id
})
potato = Repo.insert!(%Roots.Ingredient{
  name: "potato",
  amount: 3.0,
  unit: "lbs",
  recipe_id: beef_potato_stew.id
})
chicken = Repo.insert!(%Roots.Ingredient{
  name: "chicken",
  amount: 2.0,
  unit: "lbs",
  recipe_id: baked_chicken.id
})
potato = Repo.insert!(%Roots.Ingredient{
  name: "potato",
  amount: 3.0,
  unit: "lbs",
  recipe_id: baked_chicken.id
})
lemon = Repo.insert!(%Roots.Ingredient{
  name: "lemon",
  amount: 1.0,
  unit: "whole lemon",
  recipe_id: baked_chicken.id
})
garlic = Repo.insert!(%Roots.Ingredient{
  name: "garlic",
  amount: 3.0,
  unit: "cloves",
  recipe_id: baked_chicken.id
})
beef = Repo.insert!(%Roots.Ingredient{
  name: "beef",
  amount: 2.0,
  unit: "lbs",
  recipe_id: french_dish.id
})
potato = Repo.insert!(%Roots.Ingredient{
  name: "potato",
  amount: 3.0,
  unit: "lbs",
  recipe_id: french_dish.id
})
red_wine = Repo.insert!(%Roots.Ingredient{
  name: "red wine",
  amount: 7.0,
  unit: "oz",
  recipe_id: french_dish.id
})
