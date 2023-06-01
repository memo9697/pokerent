Rails.application.routes.draw do
  get 'dashboard/index'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :pokemons
  resources :postedpokemons do
    resources :bookings, only: [:create]
  end




  get '/dashboard', to: 'dashboard#index', as: 'dashboard'
  # get "pokemons", to: "pokemons#index", as: :pokemons
  # get "pokemons/new", to: "pokemons#new", as: :new_pokemon
  # post "pokemons", to: "pokemons#create"
  # get "pokemons/:id", to: "pokemons#show", as: :pokemon
  # get "pokemons/:id/edit", to: "pokemons#edit", as: :edit_pokemon
  # patch "pokemons/:id", to: "pokemons#update"
  # delete "pokemons/:id", to: "pokemons#destroy"
end
