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

ActiveRecord::Schema.define(version: 20140502002052) do

  create_table "comments", force: true do |t|
    t.text     "body"
    t.integer  "user_id"
    t.integer  "link_id"
    t.integer  "comment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["comment_id"], name: "index_comments_on_comment_id"
  add_index "comments", ["link_id"], name: "index_comments_on_link_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "link_subs", force: true do |t|
    t.integer  "link_id"
    t.integer  "sub_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "link_subs", ["link_id"], name: "index_link_subs_on_link_id"
  add_index "link_subs", ["sub_id"], name: "index_link_subs_on_sub_id"

  create_table "links", force: true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "body"
  end

  add_index "links", ["user_id"], name: "index_links_on_user_id"

  create_table "subs", force: true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subs", ["title"], name: "index_subs_on_title", unique: true
  add_index "subs", ["user_id"], name: "index_subs_on_user_id"

  create_table "user_votes", force: true do |t|
    t.integer  "user_id"
    t.integer  "link_id"
    t.boolean  "upvote"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_votes", ["link_id"], name: "index_user_votes_on_link_id"
  add_index "user_votes", ["user_id"], name: "index_user_votes_on_user_id"

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["token"], name: "index_users_on_token", unique: true
  add_index "users", ["username"], name: "index_users_on_username", unique: true

end
