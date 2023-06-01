class RemoveLevelAndGenderFromPokemons < ActiveRecord::Migration[7.0]
  def change
    remove_column :pokemons, :level
    remove_column :pokemons, :gender
  end
end
