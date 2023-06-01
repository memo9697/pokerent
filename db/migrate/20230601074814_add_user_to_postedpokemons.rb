class AddUserToPostedpokemons < ActiveRecord::Migration[7.0]
  def change
    add_reference :posted_pokemons, :user, foreign_key: true
  end
end
