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

ActiveRecord::Schema.define(version: 20171007211407) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "street",     null: false
    t.integer  "city_id"
    t.integer  "state_id"
    t.bigint   "zip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id", "state_id", "zip"], name: "index_addresses_on_city_id_and_state_id_and_zip", using: :btree
  end

  create_table "carts", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "product_id"
    t.integer  "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_carts_on_product_id", using: :btree
    t.index ["user_id"], name: "index_carts_on_user_id", using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name",        null: false
    t.text     "description", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "cart_id"
    t.string   "phone",               null: false
    t.string   "cc",                  null: false
    t.integer  "shipping_address_id", null: false
    t.integer  "billing_address_id",  null: false
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["cart_id"], name: "index_orders_on_cart_id", using: :btree
    t.index ["shipping_address_id", "billing_address_id"], name: "index_orders_on_shipping_address_id_and_billing_address_id", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.integer  "category_id"
    t.string   "title",       null: false
    t.text     "description", null: false
    t.integer  "price",       null: false
    t.string   "sku",         null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_products_on_category_id", using: :btree
  end

  create_table "states", force: :cascade do |t|
    t.string   "long_name",  null: false
    t.string   "abbr",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name", null: false
    t.string   "last_name",  null: false
    t.string   "email",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "addresses", "cities"
  add_foreign_key "addresses", "states"
  add_foreign_key "carts", "products"
  add_foreign_key "carts", "users"
  add_foreign_key "orders", "addresses", column: "billing_address_id"
  add_foreign_key "orders", "addresses", column: "shipping_address_id"
  add_foreign_key "orders", "carts"
  add_foreign_key "products", "categories"
end
