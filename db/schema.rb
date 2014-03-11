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

ActiveRecord::Schema.define(version: 20140311183559) do

  create_table "deals", force: true do |t|
    t.integer  "deal_id"
    t.integer  "len"
    t.text     "description"
    t.date     "offer_starts_at"
    t.date     "offer_ends_at"
    t.string   "merchant_name"
    t.string   "short_title"
    t.string   "image_url"
    t.string   "city_name"
    t.string   "dma"
    t.float    "ls_pct"
    t.float    "feature_price"
    t.float    "feature_value"
    t.string   "sales_rep"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dmas", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"

  create_table "tinders", force: true do |t|
    t.integer  "winner_id"
    t.integer  "loser_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
