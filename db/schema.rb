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

ActiveRecord::Schema.define(version: 2020_03_11_132402) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "rental_properties", force: :cascade do |t|
    t.string "property_name"
    t.text "property_description"
    t.string "address"
    t.integer "monthly_rental_amount"
    t.integer "deposit_amount"
    t.integer "square_feet"
    t.boolean "leased", default: false
    t.string "contract_start_date"
    t.string "contract_end_date"
    t.integer "user_id"
    t.string "image_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "tenant_id"
  end

  create_table "repairs", force: :cascade do |t|
    t.string "repair_name"
    t.boolean "repair_needed", default: true
    t.text "repair_description"
    t.integer "repair_cost"
    t.boolean "repair_completed", default: false
    t.integer "rental_property_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "supplies", force: :cascade do |t|
    t.string "supply_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tenants", force: :cascade do |t|
    t.string "renter"
    t.string "co_renter"
    t.string "address"
    t.string "renter_email"
    t.string "co_renter_email"
    t.string "renter_cell_phone"
    t.string "co_renter_cell_phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "google_token"
    t.string "google_refresh_token"
  end

end
