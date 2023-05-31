class AddPokedexIdToPokemonModel < ActiveRecord::Migration[7.0]
  def change
    add_column :pokemons, :pokedex_id, :string
  end
end
