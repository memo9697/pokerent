class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :posted_pokemon
end
