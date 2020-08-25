# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_18_224750) do

  create_table "cards", force: :cascade do |t|
    t.string "period"
    t.string "name"
    t.text "full_meaning"
    t.string "upright_meaning"
    t.string "reversed_meaning"
    t.string "image"
    t.string "orientation"
    t.integer "reading_id"
    t.integer "user_id"
    t.index ["reading_id"], name: "index_cards_on_reading_id"
    t.index ["user_id"], name: "index_cards_on_user_id"
  end

  create_table "readings", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "date_time_created"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "cards", "readings"
  add_foreign_key "cards", "users"
end
