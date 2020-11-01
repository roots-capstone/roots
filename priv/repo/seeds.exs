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

# Jessye's Family Members
naftali = Repo.insert!(%Roots.User{
  name: "Naftali",
  email: "naftali@roots.com"
})
menachem = Repo.insert!(%Roots.User{
  name: "Menachem",
  email: "menachem@roots.com"
})
rukhl = Repo.insert!(%Roots.User{
  name: "Rukhl",
  email: "rukhl@roots.com"
})
lynne = Repo.insert!(%Roots.User{
  name: "Lynne",
  email: "lynne@roots.com"
})
jenna = Repo.insert!(%Roots.User{
  name: "Jenna",
  email: "jenna@roots.com"
})
gedaliah = Repo.insert!(%Roots.User{
  name: "Gedaliah",
  email: "gedaliah@roots.com"
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
  title: "Jewish Food",
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
   description: "A hearty beef and potato stew",
   instructions: "Cook in a crockpot",
   title: "Campfire Stew",
   author: "Michael Alex",
   cookbook_id: michael_alexs_cookbook.id
})
baked_chicken = Repo.insert!(%Roots.Recipe{
   description: "Lemon-garlic baked chicken cooked with potatoes",
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

cholent = Repo.insert!(%Roots.Recipe{
   description: "Classic Ashkenazi Jewish cholent",
   instructions: """1. In a large slow cooker (the larger the better!), place the potatoes in a single layer on the bottom of the cooking vessel.
    2. Sprinkle the onions over the potatoes.
    3. Place the beef in a single layer on top of the onions and potatoes. Place the two marrow bones in the meat.  Add the kishke to the cooker.
    4. Sprinkle the beans (raw or pre-soaked) and optional grains over the top of the meat. Place the three whole garlic cloves into the meat, evenly spaced. Sprinkle the whole mixture with the black pepper.
    5. Rinse the eggs well and then tuck them into the meat. In a 4-cup container, whisk together the low sodium chicken broth, kosher salt, paprika, turmeric, cumin and cayenne.
    6. Pour the liquid over the cholent. Add additional water until all of the beans and pieces of meat are covered.
    7. Cover the slow cooker. Cook on low heat for 16 hours.
    """
   title: "Cholent",
   author: "Jessye",
   cookbook_id: jessyes_cookbook.id
})
sabich = Repo.insert!(%Roots.Recipe{
   description: "Lemon=garlic baked chicken cooked with potatoes",
   instructions: "Bake at 375F",
   title: "Greek Chicken and Potatoes",
   author: "Naftali",
   cookbook_id: jessyes_cookbook.id
})
jahnun = Repo.insert!(%Roots.Recipe{
   description: "A classic French dish",
   instructions: "Cook the beef and carrots in red wine",
   title: "Beef Bourguinon",
   author: "Michael Alex",
   cookbook_id: jessyes_cookbook.id
})
sabich = Repo.insert!(%Roots.Recipe{
   description: "Lemon=garlic baked chicken cooked with potatoes",
   instructions: "Bake at 375F",
   title: "Greek Chicken and Potatoes",
   author: "Naftali",
   cookbook_id: jessyes_cookbook.id
})
jahnun = Repo.insert!(%Roots.Recipe{
   description: "A classic French dish",
   instructions: "Cook the beef and carrots in red wine",
   title: "Beef Bourguinon",
   author: "Michael Alex",
   cookbook_id: jessyes_cookbook.id
})

# INGREDIENTS

red_potatoes = Repo.insert!(%Roots.Ingredient{
  name: "large red potatoes, peeled and halved",
  amount: 2.5,
  unit: "lbs",
  recipe_id: cholent.id
})
onions = Repo.insert!(%Roots.Ingredient{
  name: "whole onions, chopped",
  amount: 2.0,
  unit: "onions",
  recipe_id: cholent.id
})
red_potatoes = Repo.insert!(%Roots.Ingredient{
  name: "large red potatoes, peeled and halved",
  amount: 2.5,
  unit: "lbs",
  recipe_id: cholent.id
})
stew_meat = Repo.insert!(%Roots.Ingredient{
  name: "beef stew meat or brisket, cut into chunks",
  amount: 2.5,
  unit: "lbs",
  recipe_id: cholent.id
})
marrow_bones = Repo.insert!(%Roots.Ingredient{
  name: "marrow bones",
  amount: 2.0,
  unit: "pieces",
  recipe_id: cholent.id
})
beans = Repo.insert!(%Roots.Ingredient{
  name: "lima, pinto, chickpeas, red beans (not kidney), or a mixture",
  amount: 1.0,
  unit: "cups",
  recipe_id: cholent.id
})
kasha = Repo.insert!(%Roots.Ingredient{
  name: "pearl barley or coarse-grain kasha (optional - for gluten free, do not use pearl barley)",
  amount: 0.5,
  unit: "cups",
  recipe_id: cholent.id
})
garlic = Repo.insert!(%Roots.Ingredient{
  name: "whole garlic cloves",
  amount: 3.0,
  unit: "cloves",
  recipe_id: cholent.id
})
eggs = Repo.insert!(%Roots.Ingredient{
  name: "eggs",
  amount: 6.0,
  unit: "eggs",
  recipe_id: cholent.id
})
chicken_broth = Repo.insert!(%Roots.Ingredient{
  name: "low sodium chicken broth",
  amount: 1.0,
  unit: "quarts",
  recipe_id: cholent.id
})
salt = Repo.insert!(%Roots.Ingredient{
  name: "kosher salt",
  amount: 1.0,
  unit: "tbsp",
  recipe_id: cholent.id
})
paprika = Repo.insert!(%Roots.Ingredient{
  name: "paprika",
  amount: 1.5,
  unit: "tsp",
  recipe_id: cholent.id
})
turmeric = Repo.insert!(%Roots.Ingredient{
  name: "turmeric",
  amount: 1.5,
  unit: "tsp",
  recipe_id: cholent.id
})
cumin = Repo.insert!(%Roots.Ingredient{
  name: "cumin",
  amount: 1.0,
  unit: "tsp",
  recipe_id: cholent.id
})
cayenne = Repo.insert!(%Roots.Ingredient{
  name: "cayenne",
  amount: 0.25,
  unit: "tsp",
  recipe_id: cholent.id
})
kishe = Repo.insert!(%Roots.Ingredient{
  name: "kishke",
  amount: 1.0,
  unit: "loaf",
  recipe_id: cholent.id
})
water = Repo.insert!(%Roots.Ingredient{
  name: "water (amount varies)",
  amount: 8.0,
  unit: "cups",
  recipe_id: cholent.id
})

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
