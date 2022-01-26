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

ActiveRecord::Schema.define(version: 2022_01_25_204311) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "professionals_salons", force: :cascade do |t|
    t.integer "professional_id", null: false
    t.integer "salon_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "salons", force: :cascade do |t|
    t.string "name", null: false
    t.text "address", null: false
    t.string "phone", null: false
    t.string "email", default: "", null: false
    t.text "notes", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "salon_owner_id", null: false
  end

  create_table "services", force: :cascade do |t|
    t.integer "category", default: 0, null: false
    t.integer "salon_id", null: false
    t.string "name", null: false
    t.text "description", null: false
    t.integer "duration", default: 1, null: false
    t.integer "price", default: 1, null: false
    t.integer "hidden_price"
    t.integer "availability", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_services_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "middle_name"
    t.string "email", null: false
    t.string "work_email"
    t.string "phone", null: false
    t.string "work_phone"
    t.datetime "birthday", null: false
    t.integer "role", default: 0, null: false
    t.integer "status", default: 0
    t.text "notes"
    t.string "image_url", null: false
    t.integer "rating", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "visits", force: :cascade do |t|
    t.datetime "start_at", null: false
    t.datetime "end_at", null: false
    t.integer "price", null: false
    t.text "address", null: false
    t.integer "status", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "client_id", null: false
    t.integer "salon_id", null: false
  end

  create_table "visits_services", force: :cascade do |t|
    t.integer "visit_id", null: false
    t.integer "service_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "professionals_salons", "salons", on_delete: :cascade
  add_foreign_key "professionals_salons", "users", column: "professional_id", on_delete: :cascade
  add_foreign_key "salons", "users", column: "salon_owner_id", on_delete: :cascade
  add_foreign_key "visits", "users", column: "client_id", on_delete: :cascade
end
