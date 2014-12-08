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

ActiveRecord::Schema.define(version: 20141208163443) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "coordinates", force: true do |t|
    t.string  "street_address"
    t.string  "zipcode_address"
    t.string  "city_address"
    t.string  "lat"
    t.string  "lng"
    t.integer "poker_game_id"
  end

  add_index "coordinates", ["poker_game_id"], name: "index_coordinates_on_poker_game_id", using: :btree

  create_table "game_participations", force: true do |t|
    t.boolean  "is_accepted"
    t.datetime "answered_at"
    t.integer  "user_id"
    t.integer  "poker_game_id"
  end

  add_index "game_participations", ["poker_game_id"], name: "index_game_participations_on_poker_game_id", using: :btree
  add_index "game_participations", ["user_id"], name: "index_game_participations_on_user_id", using: :btree

  create_table "messages", force: true do |t|
    t.string  "content"
    t.integer "poker_game_id"
    t.integer "user_id"
  end

  add_index "messages", ["poker_game_id"], name: "index_messages_on_poker_game_id", using: :btree
  add_index "messages", ["user_id"], name: "index_messages_on_user_id", using: :btree

  create_table "poker_games", force: true do |t|
    t.string   "gametype"
    t.date     "date"
    t.time     "hour"
    t.string   "description"
    t.integer  "nb_players_required"
    t.datetime "cancelled_at"
    t.integer  "user_id"
  end

  add_index "poker_games", ["user_id"], name: "index_poker_games_on_user_id", using: :btree

  create_table "reviews", force: true do |t|
    t.string  "content"
    t.integer "rating"
    t.integer "user_id"
  end

  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id", using: :btree

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "picture"
    t.string   "name"
    t.string   "token"
    t.datetime "token_expiry"
    t.string   "phone"
    t.boolean  "phone_verified"
    t.date     "birthday"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
