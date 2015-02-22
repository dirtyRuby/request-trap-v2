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

ActiveRecord::Schema.define(version: 20150221204856) do

  create_table "requests", force: true do |t|
    t.string   "remote_ip"
    t.string   "request_method"
    t.string   "scheme"
    t.string   "query_string"
    t.binary   "query_params"
    t.binary   "cookies"
    t.binary   "headers"
    t.integer  "trap_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "requests", ["trap_id"], name: "index_requests_on_trap_id", using: :btree

  create_table "traps", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "user_name"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "confirmed",       default: false
    t.string   "email"
  end

end
