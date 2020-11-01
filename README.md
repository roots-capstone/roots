# Roots

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]

<img src="https://github.com/roots-capstone/roots-interface/blob/main/src/assets/roots-title-logo.jpg?raw=true" alt="Logo for Roots" width="250px" height="250px">

## Table of Contents

- [Overview](#overview)
- [How to use](#how-to-use)
- [Project story](#project-story)
- [Installation](#installation)
- [GraphQL Queries](#graphql-queries)
- [GraphQL Mutations](#graphql-mutations)
- [Contributing](#contributing)
- [Acknowledgements and Resources](#acknowledgements-and-resources)

<!-- Brief Description -->

## Overview

Roots is a site that allows for a user to keep family cookbooks in a digital format, adding recipes to multiple books and being able to view and navigate the books and recipes through a pleasant UI/UX. 

The site was created for a school project that had the designers design an MVP with a Backend and Frontend team. They had to manage expectation versus time constraints and communicate the needs between both teams as new frameworks and libraries were used for learning purposes.

## How to use

* Accessing the GraphiQL interface locally or on our deployed site will allow a user to access all of the queries and mutations that are documented below. 

## Built With

- Elixir
- Phoenix
- GraphQl
- Heroku
- Semaphore

## Project Story

The full project can be found [Here](https://github.com/roots-capstone) and its [combined project board](https://github.com/orgs/roots-capstone/projects/1) where the status of future and completed features is tracked.   
Collaboration with the FE lead us to create a [GIST](https://gist.github.com/neeruram1/f02a12c6da50da3520f797a72ec53f14) to keep a current vision of the data flow, mutations, and queries.

### Wins

Learning how to implement GraphQL and learning a new framework and language with Elixir and Phoenix. 

### Struggles

Because Elixir is a functional language (vs. object oriented) there was a fair learning curve there. The biggest struggle was just trying to understand the nuances and differences of Elixir. 

## Installation

**Fork this repository:**

https://github.com/roots-capstone/roots/

**Clone your forked repository**

`git clone` and the copied URL

**Change into the directory and install the project dependencies**

`cd` into directory and run `mix deps.get` for dependencies

**Create and migrate your database**
`cd` into directory and run `mix ecto.setup`

### How to see the backend

In terminal, go to the project directory and run `mix phx.server` to start. 
Now you can visit [`localhost:4000/graphiql`](http://localhost:4000/graphiql) from your browser to interact with the queries and mutations.
You can also access the GraphiQL interface on our deployed site. [Deployed](https://glacial-falls-21490.herokuapp.com/graphiql)

## GraphQL Queries:
- Get a Recipe:
    - The recipe id will need to be sent in the request from FE
    - **Data type for recipe id = ID!**
    - **Function / Endpoint name: getRecipe**
 ```
 {
  "data": {
    "getRecipe": {
      "author": "Michael Alex",
      "cookbook": {
        "author": "MichaelAlex",
        "id": "4",
        "title": "MichaelAlex's Cookbook",
        "user": {
          "email": "michaelAlex@roots.com",
          "id": "3",
          "name": "michaelAlex"
        }
      },
      "description": "A hearty beef anmd potato stew",
      "id": "1",
      "ingredients": [
        {
          "amount": 2,
          "id": "1",
          "name": "beef",
          "unit": "lbs"
        },
        {
          "amount": 3,
          "id": "2",
          "name": "potato",
          "unit": "lbs"
        }
      ],
      "instructions": "Cook in a crockpot",
      "title": "Campfire Stew"
    }
  }
}
 ```
- Get a Cookbook
    - The cookbook id will need to be sent in the request from FE
     - **Data type for cookbook id = ID!**
    - A cookbook only belongs to one person (author) so it won't have members in the first iteration of this app
    - **Function / Endpoint name: getCookbook**
```
{
  "data": {
    "getCookbook": {
      "author": "Neeru",
      "id": "1",
      "title": "Neeru's Cookbook",
      "user": {
        "email": "neeru@roots.com",
        "id": "2",
        "name": "Neeru"
      }
    }
  }
}
```

- Get a User
    - The user id will need to be sent in the request from FE
    - **Data type for user id = ID!**
    - **Function / Endpoint name: getUser**
```
{
  "data": {
    "getUser": {
      "email": "ryan@roots.com",
      "id": "1",
      "name": "Ryan"
    }
  }
}
```

- Get Cookbooks that belong to a User
    - The user id will need to be sent in the request from FE
    - **Data type for user id = ID!**
    - **Function / Endpoint name: getUserCookbooks**
```
{
  "data": {
    "getUserCookbooks": [
      {
        "author": "Neeru",
        "id": "1",
        "title": "Neeru's Cookbook",
        "user": {
          "id": "2"
        }
      },
      {
        "author": "Neeru",
        "id": "2",
        "title": "Indian Food",
        "user": {
          "id": "2"
        }
      }
    ]
  }
}
```

## GraphQL Mutations:
- Create / Submit a Recipe
    - Since a recipe belongs to a cookbook we'll need the cookbook id sent in the request from FE
    - **Arguments needed & data types:**
        - description - String!
        - instructions - String!
        - title - String!
        - author - String!
        - cookbookId - ID!
    - **Function / Endpoint name: createRecipe**
 ```
mutation{
  createRecipe(description:"food", instructions: "cook", title: "food", author: "neeru", cookbookId:1) {
    id
  } 
}
```
- Create / Add a Cookbook
    - At this point a cookbook only belongs to one person and doesn't have members
    - Also a cookbook can be created without recipes, adding a recipe to a cookbook should be a separate request, below is the only info we need to actually create a cookbook
    - **Arguments needed & data types:**
        - author - String!
        - title - String!
        - userId - ID!
    - **Function / Endpoint name: createCookbook**
    
```
{
mutation{
  createCookbook(author: "neeru", title: "my cookbook", userId:1) {
    id
  }
}
 ```
 - Create / Add an Ingredient 
    - Mutation to create an ingredient
    - **Arguments needed & data types:**
        - amount - Float!
        - name - String!
        - recipeId - ID!
        - unit - String!
    - **Function / Endpoint name: createIngredient**
    
```
{
mutation {
  createIngredient(amount:4, name:"whiskey", recipeId:1, unit:"bottle") {
    id
  }
}
 ```
- Create a User
    - **Arguments needed & data types:**
        - email - String!
        - name - String!
    - **Function / Endpoint name: createUser**
```
mutation{
  createUser(email:"neeru.iscool.com", name:"Neeeeru") {
    id
  }
}
 ```

- Edit a Recipe - **Future Iteration**
- Edit a Cookbook - **Future Iteration**
- Delete Recipe - **Future Iteration**
- Delete Cookbook - **Future Iteration**
- Delete User - **Future Iteration**

## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

See the [open issues](https://github.com/roots-capstone/roots-interface/issues) for a list of proposed features (and known issues).

- Fork the Project

- Create your Feature Branch (`git checkout -b feature/AmazingFeature`)

- Commit your Changes (`git commit -m 'Add some AmazingFeature'`)

- Push to the Branch (`git push origin feature/AmazingFeature`)

- Open a Pull Request

## Authors

### Back End
👤 **Neeru Ram**

- Github: [neeruram1](https://github.com/neeruram1)
- LinkedIn: [Neeru She/Her](https://www.linkedin.com/in/neeru-ram-81a2b867/)

👤 **Ryan Laleh**

- Github: [RyN21](https://github.com/RyN21)
- LinkedIn: [Ryan He/Him](https://www.linkedin.com/in/ryan-laleh-0a81511a7/)

👤 **Jessye Ejdelman**

- Github: [ejdelsztejn](https://github.com/ejdelsztejn)
- LinkedIn: [Jessye](https://www.linkedin.com/in/jessye-ejdelman/)

👤 **Michael Alex Lynch**

- Github: [mlynch5187](https://github.com/mlynch5187)
- LinkedIn: [Michael He/Him](https://www.linkedin.com/in/michaelalexlynch/)



## Acknowledgements and Resources

### Front End Team
👤 **Tyler Haglund**

- Github: [relyt4me](https://github.com/relyt4me)
- LinkedIn: [Tyler He/Him](https://www.linkedin.com/in/tyler-haglund/)

👤 **Horacio Borrego**

- Github: [H-Bo214](https://github.com/H-Bo214)
- LinkedIn: [Horacio He/Him](https://www.linkedin.com/in/horacio-borrego-4a52851b0/)


[Original Project Link](https://mod4.turing.io/projects/capstone.html)

<!-- MARKDOWN LINKS & IMAGES -->

[contributors-shield]: https://img.shields.io/github/contributors/roots-capstone/roots.svg?style=flat-square
[contributors-url]: https://github.com/roots-capstone/roots/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/roots-capstone/roots.svg?style=flat-square
[forks-url]: https://github.com/roots-capstone/roots/network/members
[stars-shield]: https://img.shields.io/github/stars/roots-capstone/roots.svg?style=flat-square
[stars-url]: https://github.com/roots-capstone/roots/stargazers
[issues-shield]: https://img.shields.io/github/issues/roots-capstone/roots.svg?style=flat-square
[issues-url]: https://github.com/roots-capstone/roots/issues


## Learn more about Elixir and Phoenix

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
  

