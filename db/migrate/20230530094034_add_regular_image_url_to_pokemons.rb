class AddRegularImageUrlToPokemons < ActiveRecord::Migration[7.0]
  def change
    add_column :pokemons, :regular_img_url, :string
  end
end
