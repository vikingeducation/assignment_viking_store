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

ActiveRecord::Schema.define(version: 20160802233405) do

  create_table "addresses", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.string   "num_street", null: false
    t.string   "city",       null: false
    t.string   "state",      null: false
    t.string   "country",    null: false
    t.string   "zip",        null: false
    t.boolean  "shipping",   null: false
    t.boolean  "billing",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name",        null: false
    t.text     "description", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "credit_cards", force: :cascade do |t|
    t.integer  "user_id",            null: false
    t.string   "number",             null: false
    t.date     "exp_date",           null: false
    t.string   "security_code",      null: false
    t.integer  "billing_address_id", null: false
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "card_type"
  end

  create_table "order_products", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.integer  "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id",             null: false
    t.integer  "shipping_address_id"
    t.integer  "credit_card_id",      null: false
    t.integer  "phone_num_id",        null: false
    t.boolean  "confirmed",           null: false
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.date     "order_date"
  end

  create_table "phone_nums", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.string   "number",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "num_type"
  end

  create_table "products", force: :cascade do |t|
    t.string   "title",        null: false
    t.text     "description",  null: false
    t.decimal  "price",        null: false
    t.string   "sku",          null: false
    t.integer  "category_id",  null: false
    t.integer  "amt_in_stock", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",              null: false
    t.string   "last_name",               null: false
    t.string   "email",                   null: false
    t.integer  "default_ship_address_id"
    t.integer  "default_bill_address_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.date     "join_date"
  end

end
