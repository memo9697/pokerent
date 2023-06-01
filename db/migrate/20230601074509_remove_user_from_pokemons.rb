class RemoveUserFromPokemons < ActiveRecord::Migration[7.0]
  def change
    remove_reference :pokemons, :user, index: true, foreign_key: true
  end
end
