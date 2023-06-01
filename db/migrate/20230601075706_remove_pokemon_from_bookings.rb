class RemovePokemonFromBookings < ActiveRecord::Migration[7.0]
  def change
    remove_reference :bookings, :pokemon, foreign_key: true
  end
end
