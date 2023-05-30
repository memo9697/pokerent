class PokemonsController < ApplicationController

  def index
    @pokemons = Pokemon.all
  end

  # def new
  # end

  # def create
  # end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end

# Prefix  Verb    URI Pattern            Controller#Action
# pokemons  GET     /pokemons           pokemons#index
#              POST    /pokemons           pokemons#create
# new_pokemon  GET     /pokemons/new       pokemons#new
# edit_pokemon  GET     /pokemons/:id/edit  pokemons#edit
#  pokemon  GET     /pokemons/:id       pokemons#show
#              PATCH   /pokemons/:id       pokemons#update
#              DELETE  /pokemons/:id       pokemons#destroy
