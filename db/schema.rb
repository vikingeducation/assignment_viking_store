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

ActiveRecord::Schema.define(version: 20150723230825) do

  create_table "addresses", force: :cascade do |t|
    t.string   "ap"
    t.string   "bld",        null: false
    t.string   "street",     null: false
    t.string   "city",       null: false
    t.string   "state"
    t.string   "country",    null: false
    t.string   "zip",        null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "billings", force: :cascade do |t|
    t.string   "creditcard",  null: false
    t.string   "first_name",  null: false
    t.string   "last_name",   null: false
    t.date     "exp",         null: false
    t.string   "CVC",         null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "card_issuer"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "billing_id"
    t.integer  "buyer_id"
    t.integer  "shipping_address_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "product_orders", force: :cascade do |t|
    t.integer  "order_id",         null: false
    t.integer  "product_id",       null: false
    t.integer  "product_quantity", null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "title",           null: false
    t.text     "description"
    t.float    "price",           null: false
    t.string   "sku",             null: false
    t.integer  "category_id"
    t.integer  "amount_in_stock"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "products", ["sku"], name: "index_products_on_sku", unique: true

  create_table "shipments", force: :cascade do |t|
    t.integer  "user_id",             null: false
    t.integer  "shipment_address_id", null: false
    t.datetime "pack_date"
    t.datetime "ship_date"
    t.datetime "arrival_date"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "user_billings", force: :cascade do |t|
    t.integer  "buyer_id",   null: false
    t.integer  "billing_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",               null: false
    t.string   "last_name",                null: false
    t.string   "email",                    null: false
    t.string   "password",                 null: false
    t.integer  "default_shipping_address"
    t.integer  "default_billing_address"
    t.string   "phone"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

end
