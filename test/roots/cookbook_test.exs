# defmodule Roots.CookbookTest do
#   use RootsWeb.ConnCase
#
#   alias Roots.Cookbook
#   alias Roots.Repo
#
#   describe "#all" do
#     test "it finds all cookbooks" do
#       user = Repo.insert!(%Roots.User{
#         name: "User",
#         email: "user@roots.com"
#       })
#       usersCookbook = Repo.insert!(%Roots.Cookbook{
#         title: "User's Cookbook",
#         author: "Author Name",
#         user: user
#       })
#       persianFood = Repo.insert!(%Roots.Cookbook{
#         title: "Persion Food",
#         author: "Author Name",
#         user: user
#       })
#       results = Cookbook.all()
#       assert length(results) == 2
#       assert List.first(results).id == usersCookbook.id
#       assert List.last(results).id == persianFood.id
#     end
#   end
# end
