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

ActiveRecord::Schema.define(version: 20161129235154) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "street_address"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.string   "country"
    t.boolean  "default"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "carts", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "carts_products", id: false, force: :cascade do |t|
    t.integer "cart_id",    null: false
    t.integer "product_id", null: false
    t.integer "quantity"
    t.index ["cart_id", "product_id"], name: "index_carts_products_on_cart_id_and_product_id", using: :btree
    t.index ["product_id", "cart_id"], name: "index_carts_products_on_product_id_and_cart_id", using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "credit_cards", force: :cascade do |t|
    t.string   "number"
    t.string   "exp"
    t.string   "csv"
    t.integer  "user_id"
    t.integer  "billing_address_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "shipping_addr_id"
    t.integer  "billing_addr_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "orders_products", id: false, force: :cascade do |t|
    t.integer "order_id",   null: false
    t.integer "product_id", null: false
    t.integer "quantity"
    t.float   "cost"
    t.index ["order_id", "product_id"], name: "index_orders_products_on_order_id_and_product_id", using: :btree
    t.index ["product_id", "order_id"], name: "index_orders_products_on_product_id_and_order_id", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.float    "price"
    t.integer  "sku"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "name"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
