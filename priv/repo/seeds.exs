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
   description: """
     Our family’s cholent recipe is a reflection of the heritage of my fiance’s parents; his mother was Sephardic, his father Ashkenazi. The dish uses the basic ingredients of an Ashkenazi cholent– meat, beans, potatoes, and sometimes barley or kasha– with added Sephardic spices for flavor. We also add whole eggs to the pot, another Sephardic custom. The eggs slowly cook in the broth, soaking up the flavor of the cholent and turning a lovely brown color. I sometimes use chickpeas, as is the custom in Moroccan dafina. Other times, I use a combination of kidney, pinto, and lima beans, which are more often used in Ashkenazi cholent
   """,
   instructions: """
    1. In a large slow cooker (the larger the better!), place the potatoes in a single layer on the bottom of the cooking vessel.
    2. Sprinkle the onions over the potatoes.
    3. Place the beef in a single layer on top of the onions and potatoes. Place the two marrow bones in the meat.  Add the kishke to the cooker.
    4. Sprinkle the beans (raw or pre-soaked) and optional grains over the top of the meat. Place the three whole garlic cloves into the meat, evenly spaced. Sprinkle the whole mixture with the black pepper.
    5. Rinse the eggs well and then tuck them into the meat. In a 4-cup container, whisk together the low sodium chicken broth, kosher salt, paprika, turmeric, cumin and cayenne.
    6. Pour the liquid over the cholent. Add additional water until all of the beans and pieces of meat are covered.
    7. Cover the slow cooker. Cook on low heat for 16 hours.
    """,
   title: "Classic Family Cholent",
   author: "Jessye",
   cookbook_id: jessyes_cookbook.id
})
jahnun = Repo.insert!(%Roots.Recipe{
   description: """
   Enjoy Shabbat with delicious, traditional Yemenite Jachnun, seen all over Israel in the “Shuk”,or open air market, and bakeries. Jachnun is a flaky, rolled pastry that is delicious served warm with condiments. Although it is fun to eat, we think that the real fun is in making it yourself! If you feel like getting your fingers sticky, then let’s get started. Remember this is the traditional way to make and serve Jachnun, so feel free to add different condiments or side dishes and make it unique to you!
   """,
   instructions: """
     1. Mix the flour, date honey, baking powder, salt and water to form a dough. It will be sticky, and that’s OK. Knead and let sit for at least 10 minutes.
     2. Divide into six balls. They’ll be about the size of tennis balls.
     3. Oil your work surface. Using your hands and/or a rolling pin, roll out the dough into a 40-by-40 centimeter (16 inch) square. Oil it as needed. The dough should be very thin. If it tears, try to push it back together, but it doesn’t really matter — once it’s folded, the imperfections won’t be noticeable.
     4. Rub liberally with olive oil (or softened margarine or butter — about 1-2 teaspoons oil, 2 teaspoons butter or 1 tablespoon margarine); sprinkle lightly with yeast (if using). Fold over into thirds. You now should have a long, narrow strip. Brush oil on the top layer. Roll out again in both directions. Your strip should now be wider and longer. The width of the strip will be the length of your finished jachnun.
     5. Start rolling up the strip. Pull the dough as you go, to stretch it out even more.
     6. Arrange a thin layer of stale bread on the bottom of your baking dish or slow cooker. The bread pads the jachnun and absorbs excess oil. The traditional jachnun pan is a cylindrical metal tub with a tight-sealing top, but you can use any oven-safe dish with a tight lid.
     7. Cut strips of baking paper slightly larger than each jachnun. Rest each roll on its strip of paper — this isn’t necessary, but it will keep them from sticking to each other and falling apart when you remove them from the pan.
     8. Arrange the paper-coated jachnuns in the dish. They should be packed relatively tightly.
     9. Arrange a few clean eggs in with the jachnun. They’ll come out hard-boiled.
     10. Cover with tinfoil to help preserve moisture, seal the pot and bake overnight, for 10-12 hours — on the low setting of your slow cooker, or at 100 to 110 degrees Celsius (210 to 230 Fahrenheit) in your oven.
   """,
   title: "Yemenite Jachnun",
   author: "Naftali",
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
potato_2 = Repo.insert!(%Roots.Ingredient{
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
garlic_2 = Repo.insert!(%Roots.Ingredient{
  name: "garlic",
  amount: 3.0,
  unit: "cloves",
  recipe_id: baked_chicken.id
})
beef_2 = Repo.insert!(%Roots.Ingredient{
  name: "beef",
  amount: 2.0,
  unit: "lbs",
  recipe_id: french_dish.id
})
potato_3 = Repo.insert!(%Roots.Ingredient{
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

flour = Repo.insert!(%Roots.Ingredient{
  name: "whole wheat flour (alternative: white flour)",
  amount: 3.25,
  unit: "cups",
  recipe_id: jahnun.id
})
silan = Repo.insert!(%Roots.Ingredient{
  name: "date honey a.k.a. silan (alternative: sugar)",
  amount: 0.25,
  unit: "cups",
  recipe_id: jahnun.id
})
baking_powder = Repo.insert!(%Roots.Ingredient{
  name: "baking powder",
  amount: 0.5,
  unit: "tsp",
  recipe_id: jahnun.id
})
water_2 = Repo.insert!(%Roots.Ingredient{
  name: "cup water, or enough to give you a springy dough",
  amount: 1.25,
  unit: "cups",
  recipe_id: jahnun.id
})
oil = Repo.insert!(%Roots.Ingredient{
  name: "oil, or more if needed (alternative: about 100 grams margarine or butter)",
  amount: 1.25,
  unit: "cups",
  recipe_id: jahnun.id
})
stale_pita = Repo.insert!(%Roots.Ingredient{
  name: "stale bread or pita to line the pot",
  amount: 2.0,
  unit: "pieces",
  recipe_id: jahnun.id
})
