class PostedPokemon < ApplicationRecord
  belongs_to :pokemon
  belongs_to :user
end
