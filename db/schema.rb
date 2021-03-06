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

ActiveRecord::Schema.define(version: 20160727140620) do

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "line_items", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "cart_id"
    t.integer  "order_id"
    t.integer  "qty"
    t.string   "voltage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "line_items", ["cart_id"], name: "index_line_items_on_cart_id"
  add_index "line_items", ["order_id"], name: "index_line_items_on_order_id"

  create_table "messages", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.text     "message"
    t.string   "problem"
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "email"
    t.string   "address"
    t.integer  "postcode"
    t.string   "phone"
    t.string   "freight"
    t.text     "ps"
    t.integer  "after_ship_amount"
    t.string   "whoset"
    t.string   "ship_time"
    t.string   "status"
    t.string   "payment_status"
    t.string   "shipping_status"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "order_number"
    t.boolean  "paid",              default: false
    t.string   "district"
    t.string   "county"
  end

  create_table "payments", force: :cascade do |t|
    t.integer  "order_id"
    t.string   "payment_method"
    t.integer  "amount"
    t.boolean  "paid",           default: false
    t.text     "params"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "payments", ["order_id"], name: "index_payments_on_order_id"

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.string   "item_name"
    t.string   "description"
    t.integer  "v110_price"
    t.integer  "v220_price"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "asset_file_name"
    t.string   "asset_content_type"
    t.integer  "asset_file_size"
    t.datetime "asset_updated_at"
  end

  create_table "return_line_items", force: :cascade do |t|
    t.integer  "qty"
    t.integer  "product_id"
    t.integer  "return_order_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "return_orders", force: :cascade do |t|
    t.text     "ps"
    t.integer  "phone"
    t.integer  "user_id"
    t.string   "status"
    t.integer  "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "name"
    t.string   "address"
    t.string   "phone"
    t.integer  "amount"
    t.integer  "postcode"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "alternate_email"
    t.string   "provider"
    t.string   "uid"
    t.string   "fb_uid"
    t.string   "fb_token"
    t.text     "fb_raw_data"
    t.string   "authentication_token"
    t.string   "fb_pic"
    t.string   "time_zone"
    t.boolean  "admin"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["fb_uid"], name: "index_users_on_fb_uid"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
