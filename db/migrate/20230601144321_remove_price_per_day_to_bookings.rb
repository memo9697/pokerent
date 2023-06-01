class RemovePricePerDayToBookings < ActiveRecord::Migration[7.0]
  def change
    remove_column :bookings, :price_per_day, :integer
  end
end
