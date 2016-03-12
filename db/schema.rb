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

ActiveRecord::Schema.define(version: 20160312092443) do

  create_table "billing_addresses", force: :cascade do |t|
    t.integer  "customer_id", null: false
    t.string   "first_line",  null: false
    t.integer  "city_id",     null: false
    t.integer  "state_id",    null: false
    t.string   "zip",         null: false
    t.boolean  "default",     null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string   "email",      null: false
    t.string   "first_name", null: false
    t.string   "last_name",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers_products", id: false, force: :cascade do |t|
    t.integer "customer_id", null: false
    t.integer "product_id",  null: false
    t.integer "qty"
  end

  add_index "customers_products", ["customer_id"], name: "index_customers_products_on_customer_id"
  add_index "customers_products", ["product_id"], name: "index_customers_products_on_product_id"

  create_table "groups", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "customer_id",    null: false
    t.string   "phone",          null: false
    t.string   "credit_card",    null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "s_a_first_line"
    t.string   "s_a_city"
    t.string   "s_a_state"
    t.string   "s_a_zip"
    t.string   "b_a_first_line"
    t.string   "b_a_city"
    t.string   "b_a_state"
    t.string   "b_a_zip"
  end

  create_table "orders_products", id: false, force: :cascade do |t|
    t.integer "order_id",   null: false
    t.integer "product_id", null: false
    t.integer "qty"
  end

  add_index "orders_products", ["order_id"], name: "index_orders_products_on_order_id"
  add_index "orders_products", ["product_id"], name: "index_orders_products_on_product_id"

  create_table "products", force: :cascade do |t|
    t.string   "title",       null: false
    t.text     "description"
    t.float    "price",       null: false
    t.string   "sku",         null: false
    t.integer  "group_id",    null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "shipping_addresses", force: :cascade do |t|
    t.integer  "customer_id", null: false
    t.string   "first_line",  null: false
    t.integer  "city_id",     null: false
    t.integer  "state_id",    null: false
    t.string   "zip",         null: false
    t.boolean  "default",     null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "states", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
