class UpdatePokemonModel < ActiveRecord::Migration[7.0]
  def change
    remove_column :pokemons, :description
  end
end
