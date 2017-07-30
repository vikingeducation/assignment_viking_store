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

ActiveRecord::Schema.define(version: 20170730204334) do

  create_table "addresses", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "building_number"
    t.string   "street_name"
    t.string   "state_id"
    t.string   "city_id"
    t.string   "zip"
    t.string   "address_type"
    t.string   "default_flag"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "price"
    t.string   "sku"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "shipping_orders", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "default_shipping_addr_id"
    t.integer  "default_billing_addr_id"
    t.integer  "total_cost"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "shopping_carts", force: :cascade do |t|
    t.string   "user_id"
    t.string   "product_id"
    t.integer  "quantity"
    t.integer  "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "states", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.string   "phone_num"
    t.string   "credit_card"
    t.integer  "default_billing_addr_id"
    t.integer  "default_shipping_addr_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

end
