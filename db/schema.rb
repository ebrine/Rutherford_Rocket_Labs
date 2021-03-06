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

ActiveRecord::Schema.define(version: 20171020182127) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "employees", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "employee_id"
    t.string "password_digest"
    t.boolean "is_manager"
    t.bigint "warehouse_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["warehouse_id"], name: "index_employees_on_warehouse_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "description"
    t.bigint "warehouse_id"
    t.bigint "employee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_orders_on_employee_id"
    t.index ["warehouse_id"], name: "index_orders_on_warehouse_id"
  end

  create_table "parts", force: :cascade do |t|
    t.integer "part_no"
    t.string "name"
    t.bigint "warehouse_id"
    t.integer "removed_by_id"
    t.integer "received_by_id"
    t.boolean "removed"
    t.bigint "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_parts_on_order_id"
    t.index ["warehouse_id"], name: "index_parts_on_warehouse_id"
  end

  create_table "warehouses", force: :cascade do |t|
    t.string "city"
    t.string "location_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "parts", "warehouses"
end
