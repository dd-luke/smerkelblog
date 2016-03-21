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

ActiveRecord::Schema.define(version: 20160320192718) do

  create_table "blogs", force: :cascade do |t|
    t.string  "name",    limit: 255, null: false
    t.string  "theme",   limit: 255
    t.integer "user_id", limit: 4,   null: false
  end

  add_index "blogs", ["name"], name: "index_blogs_on_name", unique: true, using: :btree
  add_index "blogs", ["user_id"], name: "index_blogs_on_user_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.string  "title",            limit: 255,                    null: false
    t.text    "body",             limit: 65535,                  null: false
    t.integer "user_id",          limit: 4,                      null: false
    t.integer "commentable_id",   limit: 4,                      null: false
    t.string  "commentable_type", limit: 255,   default: "post", null: false
  end

  add_index "comments", ["commentable_id", "commentable_type"], name: "index_comments_on_commentable_id_and_commentable_type", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.string  "title",   limit: 255,   null: false
    t.text    "body",    limit: 65535, null: false
    t.integer "user_id", limit: 4,     null: false
    t.integer "blog_id", limit: 4,     null: false
  end

  add_index "posts", ["blog_id"], name: "index_posts_on_blog_id", using: :btree
  add_index "posts", ["title", "blog_id"], name: "index_posts_on_title_and_blog_id", unique: true, using: :btree
  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "taggings", force: :cascade do |t|
    t.integer "tag_id",        limit: 4,   null: false
    t.integer "taggable_id",   limit: 4,   null: false
    t.string  "taggable_type", limit: 255, null: false
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type"], name: "index_taggings_on_tag_id_and_taggable_id_and_taggable_type", unique: true, using: :btree
  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
  add_index "taggings", ["taggable_id", "taggable_type"], name: "index_taggings_on_taggable_id_and_taggable_type", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string "name",  limit: 255,                     null: false
    t.string "color", limit: 255, default: "#0000FF"
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string "email",    limit: 255, null: false
    t.string "password", limit: 255, null: false
    t.string "username", limit: 255, null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
