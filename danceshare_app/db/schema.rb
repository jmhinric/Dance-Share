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

ActiveRecord::Schema.define(version: 20140215222258) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "concerts", force: true do |t|
    t.integer "venue_id"
    t.integer "performance_id"
  end

  create_table "performances", force: true do |t|
    t.string  "title"
    t.integer "user_id"
    t.integer "venue_id"
  end

  create_table "performances_venues", force: true do |t|
    t.integer "performance_id"
    t.integer "venue_id"
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
