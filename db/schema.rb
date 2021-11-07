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

ActiveRecord::Schema.define(version: 2021_11_07_015813) do

  create_table "films", force: :cascade do |t|
    t.string "title"
    t.integer "episode_id"
    t.text "opening_crawl"
    t.string "director"
    t.string "producer"
    t.date "release_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "people_id", null: false
    t.integer "species_id", null: false
    t.integer "planets_id", null: false
    t.index ["people_id"], name: "index_films_on_people_id"
    t.index ["planets_id"], name: "index_films_on_planets_id"
    t.index ["species_id"], name: "index_films_on_species_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.string "birth_year"
    t.string "yey_color"
    t.string "gender"
    t.string "hair_color"
    t.integer "height"
    t.integer "mass"
    t.string "skin_color"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "planets", force: :cascade do |t|
    t.string "name"
    t.string "diameter"
    t.string "rotation_period"
    t.string "orbital_period"
    t.string "gravity"
    t.string "population"
    t.string "climate"
    t.string "terrain"
    t.string "surface_water"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "species", force: :cascade do |t|
    t.string "name"
    t.string "classification"
    t.string "designation"
    t.string "average_height"
    t.string "average_lifespan"
    t.string "eye_colors"
    t.string "hair_colors"
    t.string "skin_colors"
    t.string "language"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "people_id", null: false
    t.integer "planets_id", null: false
    t.integer "films_id", null: false
    t.index ["films_id"], name: "index_species_on_films_id"
    t.index ["people_id"], name: "index_species_on_people_id"
    t.index ["planets_id"], name: "index_species_on_planets_id"
  end

  create_table "starships", force: :cascade do |t|
    t.string "name"
    t.string "model"
    t.string "manufacturer"
    t.integer "cost_in_credits"
    t.float "length"
    t.string "crew"
    t.string "passengers"
    t.string "max_atmosphering_speed"
    t.string "hyperdrive_rating"
    t.string "MGLT"
    t.string "cargo_capacity"
    t.string "consumables"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "films_id", null: false
    t.index ["films_id"], name: "index_starships_on_films_id"
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "name"
    t.string "model"
    t.string "manufacturer"
    t.string "length"
    t.string "const_in_credits"
    t.string "crew"
    t.string "passengers"
    t.string "max_atmosphering_speed"
    t.string "cargo_capacity"
    t.string "consumables"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "films_id", null: false
    t.integer "people_id", null: false
    t.index ["films_id"], name: "index_vehicles_on_films_id"
    t.index ["people_id"], name: "index_vehicles_on_people_id"
  end

  add_foreign_key "films", "people", column: "people_id"
  add_foreign_key "films", "planets", column: "planets_id"
  add_foreign_key "films", "species"
  add_foreign_key "species", "films", column: "films_id"
  add_foreign_key "species", "people", column: "people_id"
  add_foreign_key "species", "planets", column: "planets_id"
  add_foreign_key "starships", "films", column: "films_id"
  add_foreign_key "vehicles", "films", column: "films_id"
  add_foreign_key "vehicles", "people", column: "people_id"
end
