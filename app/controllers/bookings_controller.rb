class BookingsController < ApplicationController

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.save
  end

  private

  def
    booking_params
    params.require(:booking).permit(:price_per_day, :start_date, :end_date, :status, :user_id, :pokemon_id)
  end
end
