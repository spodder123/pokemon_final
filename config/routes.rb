Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  get 'search/index', to:"search#index", as:"search"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "/"
   get "/pokemons", to:"pokemons#index", as: "pokemons"
   get "/pokemons/:id", to:"pokemons#show", as: "pokemon_show"
   get "/categories", to:"categories#index", as: "categories"
   get "/categories/:id", to:"categories#show", as: "category_show"
   get "/users/:id", to:"users#show", as: "user_show"
   get "/users/:id", to:"users#edit", as: "user_edit"
end
