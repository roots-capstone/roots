defmodule Roots.Factory do
  user ExMachina.Ecto, repo: Roots.Repo

  use ExMachina

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
      host: build(:user)
    }
  end
end
