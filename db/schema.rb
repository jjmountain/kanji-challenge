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

ActiveRecord::Schema.define(version: 2019_06_25_235923) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "core_words", force: :cascade do |t|
    t.string "expression"
    t.string "meaning"
    t.string "reading"
    t.string "audio"
    t.string "image"
    t.integer "iknowid"
    t.string "iknowtype"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "answer"
  end

  create_table "kanji_cards", force: :cascade do |t|
    t.float "easiness_factor", default: 2.5
    t.integer "repetition", default: 0
    t.integer "interval"
    t.bigint "user_id"
    t.bigint "kanji_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kanji_id"], name: "index_kanji_cards_on_kanji_id"
    t.index ["user_id"], name: "index_kanji_cards_on_user_id"
  end

  create_table "kanjis", force: :cascade do |t|
    t.string "character"
    t.text "koohii1"
    t.text "koohii2"
    t.string "onyomi"
    t.string "kunyomi"
    t.string "nanori"
    t.string "english"
    t.text "examples"
    t.integer "jlpt"
    t.text "components"
    t.integer "kanji_strokes"
    t.string "kanji_radical"
    t.integer "radical_number"
    t.integer "radical_strokes"
    t.string "radical_reading"
    t.string "classification"
    t.string "keyword"
    t.string "grade"
    t.string "frequency"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "jouyou"
    t.string "traditional"
    t.integer "rtk"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.integer "jlpt_level", default: 5
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "kanji_cards", "kanjis"
  add_foreign_key "kanji_cards", "users"
end
