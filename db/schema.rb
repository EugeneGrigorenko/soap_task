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

ActiveRecord::Schema.define(version: 20150809151027) do

  create_table "countries", force: :cascade do |t|
    t.string  "name"
    t.string  "code",        limit: 3
    t.integer "currency_id"
  end

  add_index "countries", ["code"], name: "index_countries_on_code"
  add_index "countries", ["currency_id"], name: "index_countries_on_currency_id"

  create_table "countries_trips", id: false, force: :cascade do |t|
    t.integer "country_id", null: false
    t.integer "trip_id",    null: false
  end

  add_index "countries_trips", ["trip_id", "country_id"], name: "index_countries_trips_on_trip_id_and_country_id"

  create_table "countries_users_relations", force: :cascade do |t|
    t.integer "country_id"
    t.integer "user_id"
  end

  add_index "countries_users_relations", ["country_id"], name: "index_countries_users_relations_on_country_id"
  add_index "countries_users_relations", ["user_id"], name: "index_countries_users_relations_on_user_id"

  create_table "currencies", force: :cascade do |t|
    t.string "name"
    t.string "code", limit: 3
  end

  add_index "currencies", ["code"], name: "index_currencies_on_code"

  create_table "trips", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "description"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "finished",    default: false
  end

  add_index "trips", ["user_id"], name: "index_trips_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                            null: false
    t.string   "encrypted_password",  default: "", null: false
    t.datetime "remember_created_at"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
