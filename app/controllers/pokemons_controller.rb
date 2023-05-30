class PokemonsController < ApplicationController
  before_action :set_pokemon, only: [:show, :edit, :update, :destroy]

  def index
    @pokemons = Pokemon.all
  end

  def new
    @pokemons = Pokemon.new
  end

  def create
    @pokemon = Pokemon.new(params[:pokemon])
    @pokemon.save
  end

  def show
  end

  def edit
  end

  def update
    @pokemon.update(pokemon_params)
    redirect_to pokemon_path(@pokemon)
  end

  def destroy
    @pokemon.destroy
    redirect_to pokemons_path, status: :see_other
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(:name)
    # add permit params with hugo and loic
  end

  def set_pokemon
    @pokemon = Pokemon.find(params[:id])
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
