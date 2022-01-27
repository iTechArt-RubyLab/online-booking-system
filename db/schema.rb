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

ActiveRecord::Schema.define(version: 2022_01_25_222650) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "salons", force: :cascade do |t|
    t.string "name", null: false
    t.text "address", null: false
    t.string "phone", null: false
    t.string "email", default: "", null: false
    t.text "notes", null: false
    t.integer "owner_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "salons_social_networks", force: :cascade do |t|
    t.bigint "salon_id", null: false
    t.bigint "social_network_id", null: false
    t.string "link", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["salon_id", "social_network_id"], name: "index_salons_social_networks_on_salon_id_and_social_network_id", unique: true
    t.index ["salon_id"], name: "index_salons_social_networks_on_salon_id"
    t.index ["social_network_id"], name: "index_salons_social_networks_on_social_network_id"
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

  create_table "social_networks", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "patronymic"
    t.integer "salon_id", null: false
    t.string "email", null: false
    t.string "work_email", null: false
    t.string "phone", null: false
    t.string "work_phone", null: false
    t.datetime "birthday", null: false
    t.integer "role", default: 0, null: false
    t.integer "status", default: 0, null: false
    t.text "notes"
    t.string "image_url", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "visits", force: :cascade do |t|
    t.datetime "start_at", null: false
    t.datetime "end_at", null: false
    t.integer "price", null: false
    t.text "adress", null: false
    t.integer "status", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "visits_services", force: :cascade do |t|
    t.integer "visit_id", null: false
    t.integer "salon_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "salons_social_networks", "salons"
  add_foreign_key "salons_social_networks", "social_networks"
end
