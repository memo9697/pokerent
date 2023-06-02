class BookingsController < ApplicationController

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.status = "pending"

    @booking.posted_pokemon = PostedPokemon.find(params[:postedpokemon_id])

    if @booking.save!
      redirect_to dashboard_path
    else
      redirect_to postedpokemons_path
    end
  end

  def update
    @booking = Booking.find(params[:id])




    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to dashboard_path }
        format.json
      else
        format.html { render "dashboard", status: :unprocessable_entity }
        format.json # Follow the classic Rails flow and look for a create.json view
      end
    end


  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status)
  end
end
