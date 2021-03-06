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

ActiveRecord::Schema.define(version: 20181023202559) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "album_charts", force: :cascade do |t|
    t.string "chart"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "album_formats", force: :cascade do |t|
    t.string "format"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "album_formats_albums", force: :cascade do |t|
    t.bigint "album_id"
    t.bigint "album_format_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["album_format_id"], name: "index_album_formats_albums_on_album_format_id"
    t.index ["album_id"], name: "index_album_formats_albums_on_album_id"
  end

  create_table "albums", force: :cascade do |t|
    t.string "title"
    t.string "label"
    t.date "release_date"
    t.integer "sales"
    t.string "cover_artwork_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "albums_certifications", force: :cascade do |t|
    t.bigint "album_id"
    t.bigint "certification_id"
    t.index ["album_id"], name: "index_albums_certifications_on_album_id"
    t.index ["certification_id"], name: "index_albums_certifications_on_certification_id"
  end

  create_table "api_keys", force: :cascade do |t|
    t.string "api_key"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_api_keys_on_user_id"
  end

  create_table "certifications", force: :cascade do |t|
    t.string "certifying_body"
    t.string "certification_level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nicknames", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "peak_chart_positions", force: :cascade do |t|
    t.bigint "album_chart_id"
    t.bigint "album_id"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["album_chart_id"], name: "index_peak_chart_positions_on_album_chart_id"
    t.index ["album_id"], name: "index_peak_chart_positions_on_album_id"
  end

  create_table "tracks", force: :cascade do |t|
    t.integer "track_no"
    t.string "title"
    t.string "writers"
    t.string "length"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "api_keys", "users"
end
