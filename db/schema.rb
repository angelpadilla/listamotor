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

ActiveRecord::Schema.define(version: 20160502063934) do

  create_table "brands", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "galleries", force: :cascade do |t|
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "pin_id"
  end

  add_index "galleries", ["pin_id"], name: "index_galleries_on_pin_id"

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "pin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "likes", ["pin_id"], name: "index_likes_on_pin_id"
  add_index "likes", ["user_id"], name: "index_likes_on_user_id"

  create_table "pins", force: :cascade do |t|
    t.string   "title"
    t.text     "desc"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "user_id"
    t.integer  "brand_id"
    t.integer  "state_id"
    t.string   "color"
    t.string   "gasoline"
    t.string   "transmission"
    t.string   "city"
    t.boolean  "air"
    t.boolean  "ambiental_verification"
    t.boolean  "tenencias_pagadas"
    t.integer  "km",                     limit: 8
    t.integer  "year"
    t.integer  "price",                  limit: 8
    t.integer  "phone",                  limit: 8
    t.integer  "doors",                            default: 2
    t.integer  "likes_count",                      default: 0
  end

  add_index "pins", ["brand_id"], name: "index_pins_on_brand_id"
  add_index "pins", ["state_id"], name: "index_pins_on_state_id"
  add_index "pins", ["user_id"], name: "index_pins_on_user_id"

  create_table "states", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email",                  default: "",       null: false
    t.string   "encrypted_password",     default: "",       null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,        null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,        null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role",                   default: "normal"
    t.string   "phone"
    t.string   "city"
    t.integer  "state_id"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["state_id"], name: "index_users_on_state_id"
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true

end
