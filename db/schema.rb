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

ActiveRecord::Schema.define(version: 20170123040228) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "inventions", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "user_name"
    t.string   "email"
    t.text     "bits"
    t.text     "materials"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_inventions_on_user_id", using: :btree
  end

  create_table "photos", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "priority"
    t.integer  "invention_id"
    t.string   "media"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["invention_id"], name: "index_photos_on_invention_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "name"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.boolean  "admin"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "videos", force: :cascade do |t|
    t.integer  "invention_id"
    t.string   "name"
    t.string   "description"
    t.string   "panda_video_id"
    t.integer  "priority"
    t.string   "media"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["invention_id"], name: "index_videos_on_invention_id", using: :btree
  end

  add_foreign_key "inventions", "users"
  add_foreign_key "photos", "inventions"
  add_foreign_key "videos", "inventions"
end
