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

ActiveRecord::Schema.define(version: 2021_08_17_060012) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.string "image_id"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contents", force: :cascade do |t|
    t.bigint "quest_id"
    t.string "youtube_url"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quest_id"], name: "index_contents_on_quest_id"
  end

  create_table "nekokans", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "date"
    t.string "nekocan"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_nekokans_on_user_id"
  end

  create_table "quests", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "meeting_link"
    t.datetime "meeting_held_at"
    t.datetime "strated_at"
    t.datetime "finished_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_contents", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "content_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["content_id"], name: "index_user_contents_on_content_id"
    t.index ["user_id"], name: "index_user_contents_on_user_id"
  end

  create_table "user_quests", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "quest_id"
    t.boolean "is_owner", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quest_id"], name: "index_user_quests_on_quest_id"
    t.index ["user_id"], name: "index_user_quests_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.text "introduction"
    t.integer "total_nekokan"
    t.bigint "characters_id"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["characters_id"], name: "index_users_on_characters_id"
    t.index ["name"], name: "index_users_on_name", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "contents", "quests"
  add_foreign_key "nekokans", "users"
  add_foreign_key "user_contents", "contents"
  add_foreign_key "user_contents", "users"
  add_foreign_key "user_quests", "quests"
  add_foreign_key "user_quests", "users"
  add_foreign_key "users", "characters", column: "characters_id"
end
