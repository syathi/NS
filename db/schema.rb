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

ActiveRecord::Schema.define(version: 20160105172611) do

  create_table "admins", force: :cascade do |t|
    t.string   "adminPass"
    t.string   "staffPass"
    t.string   "secretQues"
    t.string   "secretAns"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "carts", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "clothe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "category"
    t.string   "situation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clothe_images", force: :cascade do |t|
    t.integer  "clothe_id",    null: false
    t.binary   "data"
    t.string   "content_type"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "clothe_images", ["clothe_id"], name: "index_clothe_images_on_clothe_id"

  create_table "clothes", force: :cascade do |t|
    t.string   "name"
    t.integer  "sex"
    t.string   "size"
    t.string   "color"
    t.string   "category1"
    t.string   "category2"
    t.integer  "state"
    t.integer  "value"
    t.string   "note"
    t.boolean  "recommend"
    t.boolean  "isLent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "histories", force: :cascade do |t|
    t.integer  "clothe_id"
    t.integer  "user_id"
    t.integer  "userId"
    t.integer  "clothesId"
    t.date     "returnDay"
    t.date     "sendDay"
    t.string   "sendAdress"
    t.boolean  "isSend"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "histories", ["clothe_id"], name: "index_histories_on_clothe_id"
  add_index "histories", ["user_id"], name: "index_histories_on_user_id"

  create_table "reservations", force: :cascade do |t|
    t.integer  "clothe_id"
    t.integer  "user_id"
    t.integer  "userId"
    t.integer  "clothesId"
    t.date     "returnDay"
    t.date     "sendDay"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "isSend"
    t.string   "sendAdress"
  end

  add_index "reservations", ["clothe_id"], name: "index_reservations_on_clothe_id"
  add_index "reservations", ["user_id"], name: "index_reservations_on_user_id"

  create_table "staffs", force: :cascade do |t|
    t.string   "staff_pass"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "hashed_password"
    t.string   "adress"
    t.string   "tel"
    t.string   "mail"
    t.string   "secretques"
    t.string   "secretans"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.boolean  "isFreeze"
  end

end
