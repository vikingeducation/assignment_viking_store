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

ActiveRecord::Schema.define(version: 20141005171158) do

  create_table "addresses", force: true do |t|
    t.string   "user_id"
    t.string   "address_line_1"
    t.string   "address_line_2"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.boolean  "is_inactive",    default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "billings", force: true do |t|
    t.string   "user_id"
    t.string   "address_line_1"
    t.string   "address_line_2"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.boolean  "is_inactive",    default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.integer  "category_id"
    t.string   "category_name"
    t.string   "category_description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_contents", force: true do |t|
    t.integer  "order_id"
    t.integer  "sku"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.integer  "order_id"
    t.integer  "user_id"
    t.integer  "billing_address"
    t.integer  "shipping_address"
    t.boolean  "is_placed",        default: false
    t.datetime "when_placed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payments", force: true do |t|
    t.integer  "user_id"
    t.integer  "cc_last_4"
    t.integer  "cvv"
    t.integer  "exp"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "product"
    t.string   "product_description"
    t.integer  "category_id"
    t.integer  "price"
    t.integer  "sku"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.integer  "user_id"
    t.string   "user_email"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "phone"
    t.integer  "default_billing"
    t.integer  "default_shipping"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
