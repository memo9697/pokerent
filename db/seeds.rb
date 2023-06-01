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
Booking.destroy_all
PostedPokemon.destroy_all
Pokemon.destroy_all

p "-------all pokemon destroy--------"
User.destroy_all
p "-------all user destroy--------"
puts "Database cleaned"


#methode pour créer des pokémons shiny aléatoirement
# def shiny(pokemon)
#   shiny_pokemon = 7
#   range = (1..10).to_a.sample
#   if range == shiny_pokemon
#     {
#       shiny_img_url: pokemon["sprites"]["shiny"],
#       shiny_flag: true
#     }
#   else
#     {
#       shiny_img_url: pokemon["sprites"]["regular"],
#       shiny_flag: false
#     }
#   end
# end

url = "https://api-pokemon-fr.vercel.app/api/v1/gen/1"

pokemons = JSON.parse(URI.open("#{url}").read)

pokemons.each do |pokemon|
  first_type = pokemon["types"][0]["name"]
  second_type = pokemon["types"][1] ? pokemon["types"][1]["name"] : ""

  stats = pokemon["stats"]
  hp = stats["hp"]
  atk = stats["atk"]
  defe = stats["def"]
  spe_atk = stats["spe_atk"]
  spe_def = stats["spe_def"]
  vit = stats["vit"]

  Pokemon.create!(
    pokedex_id: pokemon["pokedexId"],
    name: pokemon["name"]["fr"],
    shiny_img_url: pokemon["sprites"]["shiny"],
    regular_img_url: pokemon["sprites"]["regular"],
    first_type: first_type,
    second_type: second_type,
    stats: {
    hp: hp,
    atk: atk,
    defe: defe,
    spe_atk: spe_atk,
    spe_def: spe_def,
    vit: vit
    },
    height: pokemon["height"],
    weight: pokemon["weight"])
end

p "-------#{Pokemon.count} pokemon created--------"

p "-------creating users--------"

#créer des propriétaires de pokémons
hugo = User.create!(email: "hugo@gmail.com", password: "123456", username: "hugo trop chaud")
guillaume = User.create!(email: "guillaume@gmail.com", password: "123456", username: "guillaume le môme")
loic = User.create!(email: "loic@gmail.com", password: "123456", username: "loic la clique")
eva = User.create!(email: "eva@gmail.com", password: "123456", username: "eva le panda")


p "-------#{User.count} user created--------"


p "-------creating postedpokemons--------"


5.times do
  gender = ["male", "female"].sample
  level = (1..100).to_a.sample
  PostedPokemon.create!(pokemon: Pokemon.all.sample, user: hugo, gender: gender, level: level)
end


3.times do
  gender = ["male", "female"].sample
  level = (1..100).to_a.sample
  PostedPokemon.create!(pokemon: Pokemon.all.sample, user: guillaume, gender: gender, level: level)


end


2.times do
  gender = ["male", "female"].sample
  level = (1..100).to_a.sample
  PostedPokemon.create!(pokemon: Pokemon.all.sample, user: loic, gender: gender, level: level)


end


5.times do
  gender = ["male", "female"].sample
  level = (1..100).to_a.sample
  PostedPokemon.create!(pokemon: Pokemon.all.sample, user: eva, gender: gender, level: level)


end
