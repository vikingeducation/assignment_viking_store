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

ActiveRecord::Schema.define(version: 20150228051300) do

  create_table "addresses", force: :cascade do |t|
    t.string   "street_1"
    t.string   "street_2"
    t.string   "city"
    t.string   "state"
    t.integer  "zip_code"
    t.integer  "customer_profile_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "customer_profiles", force: :cascade do |t|
    t.string   "phone_number"
    t.integer  "default_shipping_address_id"
    t.integer  "default_billing_address_id"
    t.integer  "default_payment_method_id"
    t.integer  "shopping_cart_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "order_products", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.integer  "product_qty"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "customer_profile_id"
    t.integer  "shipping_address_id"
    t.integer  "billing_address_id"
    t.integer  "payment_method_id"
    t.boolean  "shopping_cart"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "payment_methods", force: :cascade do |t|
    t.integer  "customer_profile_id"
    t.string   "name_on_card"
    t.string   "card_number"
    t.datetime "exp_date"
    t.integer  "security_code"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "product_categories", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "products", force: :cascade do |t|
    t.integer  "sku"
    t.string   "name"
    t.text     "description"
    t.decimal  "price"
    t.integer  "product_category_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "name"
    t.integer  "customer_profile_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

end
