# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160201185926) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "line_1",     null: false
    t.string   "line_2"
    t.string   "city",       null: false
    t.string   "region",     null: false
    t.string   "country",    null: false
    t.string   "zip_code",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "addresses_users", id: false, force: :cascade do |t|
    t.integer "user_id",    null: false
    t.integer "address_id", null: false
  end

  add_index "addresses_users", ["address_id", "user_id"], name: "index_addresses_users_on_address_id_and_user_id", using: :btree
  add_index "addresses_users", ["user_id", "address_id"], name: "index_addresses_users_on_user_id_and_address_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name",        null: false
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "credit_cards", force: :cascade do |t|
    t.string   "cardholder_name", null: false
    t.string   "card_type",       null: false
    t.string   "card_number",     null: false
    t.date     "expiration_date", null: false
    t.string   "security_code",   null: false
    t.integer  "user_id",         null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "credit_cards", ["user_id"], name: "index_credit_cards_on_user_id", using: :btree

  create_table "order_items", force: :cascade do |t|
    t.integer  "order_id",   null: false
    t.integer  "product_id", null: false
    t.integer  "quantity",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id",             null: false
    t.integer  "billing_address_id"
    t.integer  "shipping_address_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "orders", ["billing_address_id"], name: "index_orders_on_billing_address_id", using: :btree
  add_index "orders", ["shipping_address_id"], name: "index_orders_on_shipping_address_id", using: :btree
  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name",                                              null: false
    t.text     "description"
    t.string   "sku",                                               null: false
    t.decimal  "price",       precision: 8, scale: 2, default: 0.0, null: false
    t.integer  "category_id"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree

  create_table "shopping_cart_items", force: :cascade do |t|
    t.integer  "shopping_cart_id",             null: false
    t.integer  "product_id",                   null: false
    t.integer  "quantity",         default: 1
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "shopping_cart_items", ["product_id"], name: "index_shopping_cart_items_on_product_id", using: :btree
  add_index "shopping_cart_items", ["shopping_cart_id"], name: "index_shopping_cart_items_on_shopping_cart_id", using: :btree

  create_table "shopping_carts", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "shopping_carts", ["user_id"], name: "index_shopping_carts_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name",          null: false
    t.string   "last_name",           null: false
    t.string   "email",               null: false
    t.string   "phone_number"
    t.integer  "billing_address_id"
    t.integer  "shipping_address_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "users", ["billing_address_id"], name: "index_users_on_billing_address_id", using: :btree
  add_index "users", ["shipping_address_id"], name: "index_users_on_shipping_address_id", using: :btree

end
