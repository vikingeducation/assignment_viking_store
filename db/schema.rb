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

ActiveRecord::Schema.define(version: 20170929204911) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "street_1", null: false
    t.string "street_2"
    t.string "post_code", null: false
    t.string "plus_4"
    t.string "country"
    t.string "province"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "addr_type", default: 0, null: false
    t.bigint "city_id"
    t.bigint "state_id"
    t.index ["addr_type"], name: "index_addresses_on_addr_type"
    t.index ["city_id"], name: "index_addresses_on_city_id"
    t.index ["state_id"], name: "index_addresses_on_state_id"
  end

  create_table "carts", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.bigint "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state_id"], name: "index_cities_on_state_id"
  end

  create_table "credit_cards", force: :cascade do |t|
    t.string "number", null: false
    t.datetime "expiration", null: false
    t.string "cvv"
    t.bigint "user_id"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_credit_cards_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "billing_address_id"
    t.bigint "shipping_address_id"
    t.bigint "user_id"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["billing_address_id"], name: "index_orders_on_billing_address_id"
    t.index ["shipping_address_id"], name: "index_orders_on_shipping_address_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "product_carts", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "cart_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_product_carts_on_cart_id"
    t.index ["product_id"], name: "index_product_carts_on_product_id"
  end

  create_table "product_orders", force: :cascade do |t|
    t.bigint "order_id"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_product_orders_on_order_id"
    t.index ["product_id"], name: "index_product_orders_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.bigint "category_id"
    t.string "title", null: false
    t.text "description"
    t.float "price"
    t.string "sku"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_products_on_category_id"
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
    t.string "abbrev"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_addresses", force: :cascade do |t|
    t.integer "user_id"
    t.integer "address_id"
    t.boolean "default_address", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "address_id"], name: "index_user_addresses_on_user_id_and_address_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "phone_number"
    t.datetime "joined_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["email"], name: "index_users_on_email"
  end

  add_foreign_key "addresses", "cities"
  add_foreign_key "addresses", "states"
  add_foreign_key "carts", "users"
  add_foreign_key "cities", "states"
  add_foreign_key "credit_cards", "users"
  add_foreign_key "orders", "users"
  add_foreign_key "product_carts", "carts"
  add_foreign_key "product_carts", "products"
  add_foreign_key "product_orders", "orders"
  add_foreign_key "product_orders", "products"
  add_foreign_key "products", "categories"
end
