class CreatePokemons < ActiveRecord::Migration[7.0]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.integer :level
      t.string :gender
      t.string :first_type
      t.string :second_type
      t.boolean :shiny_flag
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
