class PostedpokemonsController < ApplicationController
  def index
    @posted_pokemons = PostedPokemon.all

    if params[:pokemon]
      @show_pokemon = PostedPokemon.find(params[:pokemon])
    end

  end

  def new
    @posted_pokemon = PostedPokemon.new
  end

  def create
    @posted_pokemon = PostedPokemon.new(posted_pokemon_params)
    @posted_pokemon.save
    redirect_to postedpokemon_path(@posted_pokemon)
  end

  def show
    @posted_pokemon = PostedPokemon.find(params[:id])
  end
  private

  def posted_pokemon_params
    params.require(:posted_pokemon).permit(:pokemon_id, :level, :gender)
  end
end
