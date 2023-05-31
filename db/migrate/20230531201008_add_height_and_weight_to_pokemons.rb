class AddHeightAndWeightToPokemons < ActiveRecord::Migration[7.0]
  def change
    add_column :pokemons, :height, :string
    add_column :pokemons, :weight, :string
  end
end
