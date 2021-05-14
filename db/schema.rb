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

ActiveRecord::Schema.define(version: 2021_05_14_200835) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "complaints", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.bigint "category_id", null: false
    t.date "date_of_events"
    t.bigint "state_id", null: false
    t.bigint "municipality_id", null: false
    t.bigint "zip_id", null: false
    t.bigint "settlement_id", null: false
    t.string "street"
    t.string "number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_complaints_on_category_id"
    t.index ["municipality_id"], name: "index_complaints_on_municipality_id"
    t.index ["settlement_id"], name: "index_complaints_on_settlement_id"
    t.index ["state_id"], name: "index_complaints_on_state_id"
    t.index ["zip_id"], name: "index_complaints_on_zip_id"
  end

  create_table "municipalities", force: :cascade do |t|
    t.bigint "state_id", null: false
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["state_id"], name: "index_municipalities_on_state_id"
  end

  create_table "settlements", force: :cascade do |t|
    t.bigint "zip_id", null: false
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["zip_id"], name: "index_settlements_on_zip_id"
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username", default: ""
    t.integer "user_type", default: 0
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "zips", force: :cascade do |t|
    t.bigint "municipality_id", null: false
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["municipality_id"], name: "index_zips_on_municipality_id"
  end

  add_foreign_key "complaints", "categories"
  add_foreign_key "complaints", "municipalities"
  add_foreign_key "complaints", "settlements"
  add_foreign_key "complaints", "states"
  add_foreign_key "complaints", "zips"
  add_foreign_key "municipalities", "states"
  add_foreign_key "settlements", "zips"
  add_foreign_key "zips", "municipalities"
end
