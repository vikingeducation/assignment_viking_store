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

ActiveRecord::Schema.define(version: 20160830004817) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "line_1",      null: false
    t.string   "line_2"
    t.integer  "zip_code_id", null: false
    t.integer  "user_id",     null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name",        null: false
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "state_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orderitems", force: :cascade do |t|
    t.integer  "order_id",               null: false
    t.integer  "product_id",             null: false
    t.integer  "quantity",   default: 1, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "order_date",  null: false
    t.integer  "user_id",     null: false
    t.integer  "billing_id",  null: false
    t.integer  "shipping_id", null: false
    t.string   "phone",       null: false
    t.string   "credit_card", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name",                    null: false
    t.text     "description",             null: false
    t.integer  "category_id",             null: false
    t.integer  "units",       default: 1, null: false
    t.string   "sku_number",              null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "states", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "country_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "firstname",   null: false
    t.string   "lastname",    null: false
    t.string   "email",       null: false
    t.integer  "billing_id"
    t.integer  "shipping_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "zipcodes", force: :cascade do |t|
    t.integer  "code",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
