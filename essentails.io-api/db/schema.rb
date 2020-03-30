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

ActiveRecord::Schema.define(version: 20200328204659) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "consumers", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone_number"
    t.string   "password"
    t.string   "flat_number"
    t.string   "building_name"
    t.string   "landmark"
    t.string   "area"
    t.string   "city"
    t.string   "state"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "orderitems", force: :cascade do |t|
    t.string   "name"
    t.float    "quantity"
    t.float    "price"
    t.integer  "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_orderitems_on_order_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.float    "price"
    t.string   "status"
    t.integer  "consumer_id"
    t.integer  "serviceprovider_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["consumer_id"], name: "index_orders_on_consumer_id", using: :btree
    t.index ["serviceprovider_id"], name: "index_orders_on_serviceprovider_id", using: :btree
  end

  create_table "serviceproviders", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone_number"
    t.string   "password"
    t.string   "area"
    t.string   "city"
    t.string   "state"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "type_of_service"
  end

  create_table "services", force: :cascade do |t|
    t.string   "name"
    t.float    "price"
    t.string   "unit"
    t.float    "max_order_limit"
    t.string   "out_of_stock"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "serviceprovider_id"
  end

  add_foreign_key "orderitems", "orders"
  add_foreign_key "orders", "consumers"
  add_foreign_key "orders", "serviceproviders"
end
