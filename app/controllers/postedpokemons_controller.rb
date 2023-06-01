class PostedpokemonsController < ApplicationController
  def index
    @posted_pokemons = PostedPokemon.all

    if current_user
      @posted_pokemons = PostedPokemon.where(user: current_user)
    end

    if params[:pokemon]
      @clicked_pokemon = PostedPokemon.find(params[:pokemon])
      @booking = Booking.new
    else
      @clicked_pokemon = PostedPokemon.first
      @booking = Booking.new
    end

  end

  def new
    @posted_pokemon = PostedPokemon.new
    @pokemons = Pokemon.all
  end

  def create
    @posted_pokemon = PostedPokemon.new(posted_pokemon_params)
    @posted_pokemon.user = current_user
    @posted_pokemon.save!
    redirect_to postedpokemons_path
  end

  def show
    @posted_pokemon = PostedPokemon.find(params[:id])
  end
  private

  def posted_pokemon_params
    params.require(:posted_pokemon).permit(:pokemon_id, :level, :gender, :user_id)
  end
end
