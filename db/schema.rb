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

ActiveRecord::Schema.define(version: 20150222215112) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blips", force: :cascade do |t|
    t.string   "body"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "sentence_id"
    t.integer  "user_id"
  end

  add_index "blips", ["sentence_id"], name: "index_blips_on_sentence_id", using: :btree

  create_table "blips_users", force: :cascade do |t|
    t.integer "blip_id"
    t.integer "user_id"
  end

  add_index "blips_users", ["blip_id"], name: "index_blips_users_on_blip_id", using: :btree
  add_index "blips_users", ["user_id"], name: "index_blips_users_on_user_id", using: :btree

  create_table "dictionaries", force: :cascade do |t|
    t.string   "word"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sentence_tags", force: :cascade do |t|
    t.integer  "sentence_id"
    t.integer  "tag_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "sentence_tags", ["sentence_id"], name: "index_sentence_tags_on_sentence_id", using: :btree
  add_index "sentence_tags", ["tag_id"], name: "index_sentence_tags_on_tag_id", using: :btree

  create_table "sentences", force: :cascade do |t|
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_blips", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "blip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_blips", ["blip_id"], name: "index_user_blips_on_blip_id", using: :btree
  add_index "user_blips", ["user_id"], name: "index_user_blips_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.text     "country"
    t.integer  "age"
    t.text     "gender"
    t.text     "city"
    t.string   "name"
  end

  add_foreign_key "sentence_tags", "sentences"
  add_foreign_key "sentence_tags", "tags"
  add_foreign_key "user_blips", "blips"
  add_foreign_key "user_blips", "users"
end
