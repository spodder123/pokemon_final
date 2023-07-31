Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
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
   get "/users/:id/edit", to:"users#edit", as: "user_edit"
   patch "/users/:id/update", to:"users#update", as: "user_update"
   post 'pokemons/addtocart', to:"cart#addtocart", as: "addtocart"
   get "/cart", to:"cart#index", as: "cart"
   delete 'pokemons/removeitem', to:"cart#removeitem", as: "removeitem"
   put 'pokemons/editcart', to: "cart#editcart", as: "editcart"
   get "/about", to:"abouts#show", as: "abouts"
   get "/contact", to:"contacts#show", as: "contacts"
end
