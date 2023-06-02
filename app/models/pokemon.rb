class Pokemon < ApplicationRecord
  has_many :posted_pokemons
  validates :name, presence: true
end
