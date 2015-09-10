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

ActiveRecord::Schema.define(version: 20150910092524) do

  create_table "addresses", force: :cascade do |t|
    t.string   "first_add",  null: false
    t.string   "second_add", null: false
    t.string   "city",       null: false
    t.string   "state",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "carts", force: :cascade do |t|
    t.integer  "price",      null: false
    t.integer  "buyer_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "catagories", force: :cascade do |t|
    t.string   "description", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string   "user_name",  null: false
    t.integer  "bill_add",   null: false
    t.integer  "ship_add",   null: false
    t.integer  "price",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payments", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.string   "card_num",   null: false
    t.string   "card_type",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "title",       null: false
    t.string   "description", null: false
    t.integer  "price",       null: false
    t.string   "SKU",         null: false
    t.integer  "catalog",     null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",   null: false
    t.string   "email",      null: false
    t.string   "phone",      null: false
    t.integer  "ship_add",   null: false
    t.integer  "bill_add",   null: false
    t.integer  "sub_add"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
