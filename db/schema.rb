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

ActiveRecord::Schema.define(version: 20150925005520) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "street"
    t.string   "post_office_box"
    t.integer  "city_id"
    t.integer  "state_id"
    t.integer  "zip_code_id"
    t.integer  "country_id"
    t.integer  "profile_id"
    t.integer  "shipment_id"
    t.integer  "residence_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["city_id"], name: "index_addresses_on_city_id", using: :btree
    t.index ["country_id"], name: "index_addresses_on_country_id", using: :btree
    t.index ["profile_id"], name: "index_addresses_on_profile_id", using: :btree
    t.index ["residence_id"], name: "index_addresses_on_residence_id", using: :btree
    t.index ["shipment_id"], name: "index_addresses_on_shipment_id", using: :btree
    t.index ["state_id"], name: "index_addresses_on_state_id", using: :btree
    t.index ["zip_code_id"], name: "index_addresses_on_zip_code_id", using: :btree
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name",       limit: 32
    t.integer  "state_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["state_id"], name: "index_cities_on_state_id", using: :btree
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name",         limit: 32
    t.string   "abbreviation", limit: 3
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "credit_card_companies", force: :cascade do |t|
    t.string   "name",       limit: 32
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "credit_cards", force: :cascade do |t|
    t.string   "number",          limit: 19
    t.date     "expiration_date"
    t.integer  "profile_id"
    t.integer  "company_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["company_id"], name: "index_credit_cards_on_company_id", using: :btree
    t.index ["profile_id"], name: "index_credit_cards_on_profile_id", using: :btree
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_items_on_order_id", using: :btree
    t.index ["product_id"], name: "index_order_items_on_product_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.boolean  "is_paid",     default: false
    t.integer  "user_id"
    t.integer  "shipment_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["shipment_id"], name: "index_orders_on_shipment_id", using: :btree
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
  end

  create_table "product_categories", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name",                limit: 32
    t.text     "description"
    t.integer  "units"
    t.string   "sku",                 limit: 32
    t.decimal  "price",                          precision: 9, scale: 2, default: "0.0"
    t.integer  "product_category_id"
    t.datetime "created_at",                                                             null: false
    t.datetime "updated_at",                                                             null: false
    t.index ["product_category_id"], name: "index_products_on_product_category_id", using: :btree
    t.index ["sku"], name: "index_products_on_sku", unique: true, using: :btree
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "first_name",          limit: 32
    t.string   "last_name",           limit: 32
    t.string   "phone_number",        limit: 15
    t.integer  "credit_card_id"
    t.integer  "billing_address_id"
    t.integer  "shipping_address_id"
    t.integer  "user_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["billing_address_id"], name: "index_profiles_on_billing_address_id", using: :btree
    t.index ["credit_card_id"], name: "index_profiles_on_credit_card_id", using: :btree
    t.index ["shipping_address_id"], name: "index_profiles_on_shipping_address_id", using: :btree
    t.index ["user_id"], name: "index_profiles_on_user_id", using: :btree
  end

  create_table "shipments", force: :cascade do |t|
    t.datetime "departure_time"
    t.datetime "arrival_time"
    t.integer  "destination_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["destination_id"], name: "index_shipments_on_destination_id", using: :btree
  end

  create_table "states", force: :cascade do |t|
    t.string   "name",         limit: 32
    t.string   "abbreviation", limit: 2
    t.integer  "country_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["country_id"], name: "index_states_on_country_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "username",   limit: 32
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "zip_codes", force: :cascade do |t|
    t.string   "code",       limit: 32
    t.integer  "state_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["state_id"], name: "index_zip_codes_on_state_id", using: :btree
  end

end
