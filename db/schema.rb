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

ActiveRecord::Schema.define(version: 20160820060830) do

  create_table "addresses", force: :cascade do |t|
    t.string   "country"
    t.string   "province"
    t.string   "city"
    t.string   "postcode"
    t.string   "address_1"
    t.string   "address_2"
    t.boolean  "shipping_default"
    t.boolean  "billing_default"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "user_detail_id"
    t.index ["user_detail_id"], name: "index_addresses_on_user_detail_id"
  end

  create_table "cart_products", force: :cascade do |t|
    t.integer  "quantity"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "shopping_cart_id"
    t.integer  "product_id"
    t.index ["product_id"], name: "index_cart_products_on_product_id"
    t.index ["shopping_cart_id"], name: "index_cart_products_on_shopping_cart_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "credit_cards", force: :cascade do |t|
    t.string   "card_number"
    t.string   "mvc_number"
    t.datetime "expire_date"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "user_detail_id"
    t.index ["user_detail_id"], name: "index_credit_cards_on_user_detail_id"
  end

  create_table "products", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "SKU_number"
    t.integer  "price"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "category_id"
    t.index ["category_id"], name: "index_products_on_category_id"
  end

  create_table "shopping_carts", force: :cascade do |t|
    t.boolean  "checked"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_shopping_carts_on_user_id"
  end

  create_table "user_details", force: :cascade do |t|
    t.string   "phone_number"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_user_details_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
