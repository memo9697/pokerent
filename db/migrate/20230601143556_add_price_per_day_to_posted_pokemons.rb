class AddPricePerDayToPostedPokemons < ActiveRecord::Migration[7.0]
  def change
    add_column :posted_pokemons, :price_per_day, :integer
  end
end
