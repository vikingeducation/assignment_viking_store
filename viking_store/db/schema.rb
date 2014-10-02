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

ActiveRecord::Schema.define(version: 20141002193957) do

  create_table "addresses", force: true do |t|
    t.integer  "user_id"
    t.string   "street1"
    t.string   "city1"
    t.string   "state1"
    t.integer  "zip1"
    t.boolean  "default_address1", default: false
    t.string   "street2"
    t.string   "city2"
    t.string   "state2"
    t.integer  "zip2"
    t.boolean  "default_address2", default: false
    t.string   "street3"
    t.string   "city3"
    t.string   "state3"
    t.integer  "zip3"
    t.boolean  "default_address3", default: false
    t.string   "street4"
    t.string   "city4"
    t.string   "state4"
    t.integer  "zip4"
    t.boolean  "default_address4", default: false
    t.string   "street5"
    t.string   "city5"
    t.string   "state5"
    t.integer  "zip5"
    t.boolean  "default_address5", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "carts", force: true do |t|
    t.integer  "user_id"
    t.integer  "product_id"
    t.integer  "product_quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.integer  "product_id"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.integer  "cart_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payments", force: true do |t|
    t.integer  "user_id"
    t.integer  "cc_number"
    t.integer  "exp_month"
    t.integer  "exp_year"
    t.integer  "ccv"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.float    "price"
    t.string   "sku"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.integer  "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
