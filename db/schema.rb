# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_11_23_234152) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bars", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.string "city"
    t.string "state"
    t.integer "zipcode"
    t.boolean "livemusic", default: false
    t.boolean "pool", default: false
    t.boolean "darts", default: false
    t.string "activities", default: [], array: true
    t.boolean "cornhole", default: false
    t.boolean "food", default: false
    t.boolean "karaoke", default: false
    t.boolean "dancing", default: false
  end

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.string "brandtype"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "bar_id"
  end

  create_table "userlocations", force: :cascade do |t|
    t.string "searchterm"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "withindistance"
    t.string "wantedactivities", default: [], array: true
    t.boolean "livemusic", default: false
    t.boolean "pool", default: false
    t.boolean "darts", default: false
    t.boolean "cornhole", default: false
    t.boolean "food", default: false
    t.boolean "karaoke", default: false
    t.boolean "dancing", default: false
  end

end
