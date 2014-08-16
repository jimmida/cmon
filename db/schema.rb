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

ActiveRecord::Schema.define(version: 20140816061810) do

  create_table "listings", force: true do |t|
    t.string   "post_id"
    t.datetime "post_time"
    t.datetime "update_time"
    t.string   "contact_name"
    t.string   "contact_method"
    t.string   "contact_phone"
    t.string   "contact_email"
    t.string   "title"
    t.text     "body"
    t.decimal  "price",          precision: 8, scale: 2
    t.string   "region"
    t.string   "address"
    t.decimal  "longitude"
    t.decimal  "latitude"
    t.string   "category"
    t.string   "subcategory"
    t.string   "area"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
  end

end