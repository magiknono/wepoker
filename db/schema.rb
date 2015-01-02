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

ActiveRecord::Schema.define(version: 20141211101807) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "game_participations", force: :cascade do |t|
    t.boolean  "is_accepted"
    t.datetime "answered_at"
    t.integer  "user_id"
    t.integer  "poker_game_id"
  end

  add_index "game_participations", ["poker_game_id"], name: "index_game_participations_on_poker_game_id", using: :btree
  add_index "game_participations", ["user_id"], name: "index_game_participations_on_user_id", using: :btree

  create_table "messages", force: :cascade do |t|
    t.string  "content",       limit: 255
    t.integer "poker_game_id"
    t.integer "user_id"
  end

  add_index "messages", ["poker_game_id"], name: "index_messages_on_poker_game_id", using: :btree
  add_index "messages", ["user_id"], name: "index_messages_on_user_id", using: :btree

  create_table "poker_games", force: :cascade do |t|
    t.string   "gametype",            limit: 255
    t.date     "date"
    t.time     "hour"
    t.string   "description",         limit: 255
    t.integer  "nb_players_required"
    t.datetime "cancelled_at"
    t.integer  "user_id"
    t.string   "street_address",      limit: 255
    t.string   "zipcode_address",     limit: 255
    t.string   "city_address",        limit: 255
    t.float    "lat"
    t.float    "lng"
  end

  add_index "poker_games", ["user_id"], name: "index_poker_games_on_user_id", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.string  "content", limit: 255
    t.integer "rating"
    t.integer "user_id"
  end

  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider",               limit: 255
    t.string   "uid",                    limit: 255
    t.string   "name",                   limit: 255
    t.string   "token",                  limit: 255
    t.datetime "token_expiry"
    t.string   "phone",                  limit: 255
    t.boolean  "phone_verified"
    t.date     "birthday"
    t.string   "picture_file_name",      limit: 255
    t.string   "picture_content_type",   limit: 255
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
