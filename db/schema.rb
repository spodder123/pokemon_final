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

ActiveRecord::Schema[7.0].define(version: 2023_07_24_180936) do
  create_table "abouts", force: :cascade do |t|
    t.string "title"
    t.string "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string "title"
    t.string "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.decimal "price"
    t.integer "quantity"
    t.integer "order_id"
    t.integer "pokemon_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string "province"
    t.decimal "PST"
    t.decimal "GST"
    t.decimal "HST"
    t.string "status"
    t.decimal "total"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pokemons", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.string "height"
    t.string "weight"
    t.string "candy"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "category_id"
    t.integer "categories_id", null: false
    t.index ["categories_id"], name: "index_pokemons_on_categories_id"
  end

  create_table "provinces", force: :cascade do |t|
    t.string "name"
    t.decimal "PST"
    t.decimal "GST"
    t.decimal "HST"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
    t.integer "province_id"
    t.string "postal_code"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["province_id"], name: "index_users_on_province_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "pokemons", "categories", column: "categories_id"
  add_foreign_key "users", "provinces"
end
