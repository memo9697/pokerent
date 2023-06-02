class AddStatusToPostedPokemon < ActiveRecord::Migration[7.0]
  def change
    add_column :posted_pokemons, :status, :string
  end
end
