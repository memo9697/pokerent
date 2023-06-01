class Pokemon < ApplicationRecord
  has_many :postedpokemons
  validates :name, presence: true
end
