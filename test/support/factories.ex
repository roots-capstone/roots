defmodule Roots.Factory do
  use ExMachina.Ecto, repo: Roots.Repo

  def user_factory do
    %Roots.User{
      name: Faker.Name.name(),
      email: Faker.Internet.email()
    }
  end

  def cookbook_user do
    %Roots.Cookbook{
      title: Faker.Industry.En.sub_sector(),
      author: Faker.Name.name(),
      user: build(:user)
    }
  end
end
