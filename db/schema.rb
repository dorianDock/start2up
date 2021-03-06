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

ActiveRecord::Schema.define(version: 20160717141453) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "concept_categories", force: :cascade do |t|
    t.string   "label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "concept_category_links", force: :cascade do |t|
    t.integer  "concept_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "concept_statuses", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "concept_types", force: :cascade do |t|
    t.string   "label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "concepts", force: :cascade do |t|
    t.string   "title"
    t.integer  "associate_number"
    t.integer  "associate_wished_number"
    t.integer  "concept_type_id"
    t.integer  "concept_status_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "author_id"
    t.string   "content"
  end

  create_table "friend_links", force: :cascade do |t|
    t.integer  "askerId"
    t.integer  "answererId"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "interaction_types", force: :cascade do |t|
    t.text "name"
  end

  create_table "link_comments", force: :cascade do |t|
    t.text     "body"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "author_id"
  end

  create_table "link_interactions", force: :cascade do |t|
    t.integer  "interaction_type_id"
    t.integer  "user_id"
    t.integer  "useful_link_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string   "label"
    t.string   "skill_category_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "useful_link_categories", force: :cascade do |t|
    t.string   "label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "useful_links", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "useful_link_category_id"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.boolean  "is_public",               default: false, null: false
    t.string   "url"
  end

  create_table "user_link_types", force: :cascade do |t|
    t.string "title"
  end

  create_table "user_links", force: :cascade do |t|
    t.integer  "askerId"
    t.integer  "answererId"
    t.integer  "user_link_type_id"
    t.boolean  "isAccepted"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "user_skills", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "skill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email",                  default: "",    null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "firstname"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
