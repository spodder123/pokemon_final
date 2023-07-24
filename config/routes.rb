Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "/"
   get "/pokemons", to:"pokemons#index", as: "pokemons"
   get "/pokemons/:id", to:"pokemons#show", as: "pokemon_show"

end
