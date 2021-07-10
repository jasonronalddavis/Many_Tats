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

ActiveRecord::Schema.define(version: 2021_07_10_001929) do

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.string "rating"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.text "bio"
    t.integer "artist_id"
  end

  create_table "tats", force: :cascade do |t|
    t.string "style"
    t.string "color_range"
    t.float "price"
    t.json "tat_size"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.json "all_tats"
    t.string "description"
    t.integer "artist_id"
    t.integer "user_id"
    t.string "name"
    t.string "status"
    t.datetime "appointment_date"
    t.boolean "stat"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "artist_id"
    t.string "uid"
    t.string "provider"
  end

end
