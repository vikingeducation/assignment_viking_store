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

ActiveRecord::Schema.define(version: 20170221043418) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "full_name"
    t.string   "add_line1"
    t.string   "add_line2"
    t.integer  "city_id"
    t.integer  "state_id"
    t.string   "zip",        null: false
    t.integer  "country_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_addresses_on_city_id", using: :btree
    t.index ["country_id"], name: "index_addresses_on_country_id", using: :btree
    t.index ["state_id"], name: "index_addresses_on_state_id", using: :btree
    t.index ["user_id"], name: "index_addresses_on_user_id", using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name",        null: false
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "abbr"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "credit_cards", force: :cascade do |t|
    t.integer  "user_id",            null: false
    t.string   "full_name",          null: false
    t.string   "number",             null: false
    t.string   "card_type",          null: false
    t.integer  "exp_month",          null: false
    t.integer  "exp_year",           null: false
    t.integer  "billing_address_id", null: false
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["billing_address_id"], name: "index_credit_cards_on_billing_address_id", using: :btree
    t.index ["user_id"], name: "index_credit_cards_on_user_id", using: :btree
  end

  create_table "default_addresses", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "billing_id",  null: false
    t.integer  "shipping_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["billing_id"], name: "index_default_addresses_on_billing_id", using: :btree
    t.index ["shipping_id"], name: "index_default_addresses_on_shipping_id", using: :btree
    t.index ["user_id"], name: "index_default_addresses_on_user_id", using: :btree
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "quantity",   null: false
    t.integer  "product_id", null: false
    t.integer  "order_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_items_on_order_id", using: :btree
    t.index ["product_id"], name: "index_order_items_on_product_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id",             null: false
    t.integer  "billing_address_id",  null: false
    t.integer  "shipping_address_id", null: false
    t.datetime "checkout"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["billing_address_id"], name: "index_orders_on_billing_address_id", using: :btree
    t.index ["shipping_address_id"], name: "index_orders_on_shipping_address_id", using: :btree
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.string   "name",                    null: false
    t.text     "description"
    t.float    "price"
    t.string   "sku",                     null: false
    t.integer  "quantity",    default: 0
    t.integer  "category_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["category_id"], name: "index_products_on_category_id", using: :btree
  end

  create_table "states", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "abbr"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",      null: false
    t.string   "last_name",  null: false
    t.string   "first_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "addresses", "cities"
  add_foreign_key "addresses", "countries"
  add_foreign_key "addresses", "states"
  add_foreign_key "addresses", "users"
  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "products"
  add_foreign_key "orders", "users"
  add_foreign_key "products", "categories"
end
