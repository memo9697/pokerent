class AddStatsToPokemons < ActiveRecord::Migration[7.0]
  def change
    add_column :pokemons, :stats, :string
  end
end
