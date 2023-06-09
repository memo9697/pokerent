# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_06_02_095848) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.string "status"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "posted_pokemon_id"
    t.index ["posted_pokemon_id"], name: "index_bookings_on_posted_pokemon_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "pokemons", force: :cascade do |t|
    t.string "name"
    t.string "first_type"
    t.string "second_type"
    t.boolean "shiny_flag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "regular_img_url"
    t.string "shiny_img_url"
    t.string "pokedex_id"
    t.string "stats"
    t.string "height"
    t.string "weight"
  end

  create_table "posted_pokemons", force: :cascade do |t|
    t.bigint "pokemon_id", null: false
    t.integer "level"
    t.string "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.integer "price_per_day"
    t.string "status"
    t.index ["pokemon_id"], name: "index_posted_pokemons_on_pokemon_id"
    t.index ["user_id"], name: "index_posted_pokemons_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "posted_pokemons"
  add_foreign_key "bookings", "users"
  add_foreign_key "posted_pokemons", "pokemons"
  add_foreign_key "posted_pokemons", "users"
end
