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

ActiveRecord::Schema.define(version: 20151021114340) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "street"
    t.integer  "city_id"
    t.integer  "state_id"
    t.integer  "zip"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "addresses", ["user_id"], name: "index_addresses_on_user_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_contents", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.integer  "product_amt"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "order_contents", ["order_id"], name: "index_order_contents_on_order_id", using: :btree
  add_index "order_contents", ["product_id"], name: "index_order_contents_on_product_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "bill_address_id"
    t.integer  "ship_address_id"
    t.datetime "purchase_date"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "payments", force: :cascade do |t|
    t.string   "card_number"
    t.datetime "exp_date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "order_id"
  end

  add_index "payments", ["order_id"], name: "index_payments_on_order_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "title",                               null: false
    t.text     "description"
    t.string   "sku",                                 null: false
    t.decimal  "price",       precision: 8, scale: 2, null: false
    t.integer  "category_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "products", ["sku"], name: "index_products_on_sku", using: :btree
  add_index "products", ["title"], name: "index_products_on_title", using: :btree

  create_table "states", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "states", ["name"], name: "index_states_on_name", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "email",                   null: false
    t.string   "phone"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "default_ship_address_id"
    t.integer  "default_bill_address_id"
    t.datetime "join_date"
    t.string   "last_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree

end
