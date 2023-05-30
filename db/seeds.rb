# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'open-uri'
require 'json'

puts "Cleaning up database..."
Pokemon.destroy_all
p "-------all pokemon destroy--------"
User.destroy_all
p "-------all user destroy--------"
puts "Database cleaned"
hugo = User.create!(email: "hugo@gmail.com", password: "123456", username: "hugo trop chaud")
guillaume = User.create!(email: "guillaume@gmail.com", password: "123456", username: "guillaume le môme")
loic = User.create!(email: "loic@gmail.com", password: "123456", username: "loic la clique")
eva = User.create!(email: "eva@gmail.com", password: "123456", username: "eva le panda")

p "-------#{User.count} user created--------"

#owner = [hugo, guillaume, loic, eva]

url = "https://api-pokemon-fr.vercel.app/api/v1/gen/1"

  pokemons = JSON.parse(URI.open("#{url}").read)
  pokemons.each do |pokemon|

     Pokemon.create!(
       name: pokemon["name"]["fr"],
       user: hugo,
     )
  end
  p "-------#{Pokemon.count} pokemon created--------"
