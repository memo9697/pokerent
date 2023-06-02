class DashboardController < ApplicationController
  def index
    @bookings = Booking.all
    @my_pokemons = current_user.posted_pokemons

  end
end
