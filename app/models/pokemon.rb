class Pokemon < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :postedpokemons
  validates :name, presence: true
end
