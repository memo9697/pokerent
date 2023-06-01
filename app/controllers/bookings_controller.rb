class BookingsController < ApplicationController

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user

    @booking.posted_pokemon = PostedPokemon.find(params[:postedpokemon_id])

    if @booking.save!
      redirect_to root_path
    else
      redirect_to postedpokemons_path
    end
  end

  private

  def
    booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
