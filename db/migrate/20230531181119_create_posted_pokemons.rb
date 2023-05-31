class CreatePostedPokemons < ActiveRecord::Migration[7.0]
  def change
    create_table :posted_pokemons do |t|
      t.references :pokemon, null: false, foreign_key: true
      t.integer :level
      t.string :gender

      t.timestamps
    end
  end
end
