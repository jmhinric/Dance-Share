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

ActiveRecord::Schema.define(version: 20140218145508) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artists", force: true do |t|
    t.integer "user_id"
    t.integer "company_id"
  end

  create_table "companies", force: true do |t|
    t.string  "name"
    t.integer "admin_id"
    t.text    "photo_url"
  end

  create_table "performances", force: true do |t|
    t.string  "title"
    t.integer "venue_id"
    t.date    "date"
    t.time    "time"
    t.string  "pretty_date"
    t.string  "pretty_time"
    t.integer "company_id"
  end

  create_table "pieces", force: true do |t|
    t.string "choreographer"
    t.string "title"
    t.date   "premiere_date"
    t.text   "photo_url"
  end

  create_table "rep_pieces", force: true do |t|
    t.integer "company_id"
    t.integer "piece_id"
  end

  create_table "reviews", force: true do |t|
    t.string   "title"
    t.text     "review_text"
    t.integer  "rating"
    t.integer  "user_id"
    t.integer  "performance_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "gender"
    t.date     "dob"
    t.text     "photo_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_admin",        default: false
  end

  create_table "venues", force: true do |t|
    t.string  "name"
    t.string  "address"
    t.string  "city"
    t.string  "state_code"
    t.string  "postal_code"
    t.string  "cross_streets"
    t.string  "country_code"
    t.string  "neighborhoods"
    t.string  "display_address"
    t.string  "yelp_id"
    t.text    "snippet_image_url"
    t.text    "rating_image_url"
    t.integer "review_count"
    t.text    "url"
    t.text    "full_api_data"
    t.text    "image_url"
  end

end
