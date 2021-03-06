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

ActiveRecord::Schema.define(version: 20160528025016) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "access_logs", force: :cascade do |t|
    t.string   "ip"
    t.string   "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "category"
    t.integer  "user_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.json     "user_ids",   default: []
    t.boolean  "deleted",    default: false
  end

  create_table "battle_planes", force: :cascade do |t|
    t.string   "title"
    t.string   "content"
    t.integer  "sort_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "deleted",    default: false
  end

  create_table "comments", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.string   "commentable_type"
    t.integer  "commentable_id"
    t.integer  "parent_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.boolean  "deleted",          default: false
  end

  create_table "pictures", force: :cascade do |t|
    t.integer  "category"
    t.string   "resource"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "sort_id"
    t.string   "type"
    t.boolean  "deleted",    default: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",                    null: false
    t.string   "encrypted_password",     default: "",                    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,                     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
    t.boolean  "status",                 default: false,                 null: false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "username",                                               null: false
    t.boolean  "admin",                  default: false
    t.json     "video_ids",              default: []
    t.json     "article_ids",            default: []
    t.boolean  "deleted",                default: false
    t.string   "avatar"
    t.datetime "free_at",                default: '2016-05-12 22:27:33'
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "videos", force: :cascade do |t|
    t.integer  "category"
    t.string   "title"
    t.string   "image"
    t.text     "url"
    t.boolean  "deleted",     default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "is_homepage", default: false
    t.json     "user_ids",    default: []
    t.integer  "sort_id"
  end

end
