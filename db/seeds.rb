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

users = [hugo, guillaume, loic, eva]

def shiny(pokemon)
  shiny_pokemon = 7
  range = (1..10).to_a.sample
  if range == shiny_pokemon
    {
      shiny_img_url: pokemon["sprites"]["shiny"],
      shiny_flag: true
    }
  else
    {
      shiny_img_url: pokemon["sprites"]["regular"],
      shiny_flag: false
    }
  end
end

url = "https://api-pokemon-fr.vercel.app/api/v1/gen/1"
pokemons = JSON.parse(URI.open(url).read)

pokemons.each do |pokemon|
  first_type = pokemon["types"][0]["name"]
  second_type = pokemon["types"][1] ? pokemon["types"][1]["name"] : ""

  img_data = shiny(pokemon)
  level = rand(1..100)
  gender = ["male", "female"].sample

  Pokemon.create!(
    pokedex_id: pokemon["pokedexId"],
    name: pokemon["name"]["fr"],
    regular_img_url: img_data[:shiny_flag] ? nil : img_data[:shiny_img_url],
    shiny_img_url: img_data[:shiny_flag] ? img_data[:shiny_img_url] : nil,
    first_type: first_type,
    second_type: second_type,
    shiny_flag: img_data[:shiny_flag],
    level: level,
    gender: gender,
    user: users.sample
  )
end

p "-------#{Pokemon.count} pokemon created--------"
