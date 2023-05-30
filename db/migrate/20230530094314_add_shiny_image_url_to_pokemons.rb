class AddShinyImageUrlToPokemons < ActiveRecord::Migration[7.0]
  def change
    add_column :pokemons, :shiny_img_url, :string
  end
end
