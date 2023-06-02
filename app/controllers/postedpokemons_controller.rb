class PostedpokemonsController < ApplicationController
  def index
    @posted_pokemons = PostedPokemon.all

    if current_user
      @posted_pokemons = PostedPokemon.where.not(user: current_user)
    end

    if params[:pokemon]
      @clicked_pokemon = PostedPokemon.find(params[:pokemon])
      @booking = Booking.new
    else
      @clicked_pokemon = PostedPokemon.first
      @booking = Booking.new
    end

    if params[:query].present?
      sql_subquery = "name LIKE :query OR first_type LIKE :query"
      @posted_pokemons = @posted_pokemons.joins(:pokemon).where(sql_subquery, query: "%#{params[:query]}%")

      if @posted_pokemons.any?
        @clicked_pokemon = @posted_pokemons.first
      else
        @clicked_pokemon = nil
      end
    end

  end

  def new
    @posted_pokemon = PostedPokemon.new
    @pokemons = Pokemon.all
  end

  def create
    @posted_pokemon = PostedPokemon.new(posted_pokemon_params)
    @posted_pokemon.user = current_user
    @posted_pokemon.status = "pending"
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
