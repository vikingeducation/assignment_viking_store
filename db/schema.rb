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

ActiveRecord::Schema.define(version: 20150606145142) do

  create_table "addresses", force: :cascade do |t|
    t.integer  "user_id",               null: false
    t.string   "first_line"
    t.string   "second_line"
    t.string   "city"
    t.string   "state",       limit: 2
    t.integer  "zip"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name",        null: false
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "credit_cards", force: :cascade do |t|
    t.integer  "user_id",            null: false
    t.string   "credit_card_number", null: false
    t.string   "exp_date",           null: false
    t.integer  "cvv_code",           null: false
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "product_id",             null: false
    t.integer  "order_id",               null: false
    t.integer  "quantity",   default: 1, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "order_date"
    t.integer  "user_id"
    t.text     "json_snippet"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "title",       null: false
    t.text     "description"
    t.integer  "price",       null: false
    t.integer  "sku",         null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                            null: false
    t.string   "first_name",                       null: false
    t.string   "last_name",                        null: false
    t.string   "phone"
    t.integer  "default_shipping"
    t.integer  "default_billing"
    t.boolean  "is_deleted",       default: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

end
