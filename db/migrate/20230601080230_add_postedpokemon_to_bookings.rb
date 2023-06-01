class AddPostedpokemonToBookings < ActiveRecord::Migration[7.0]
  def change
    add_reference :bookings, :posted_pokemon, foreign_key: true
  end
end
