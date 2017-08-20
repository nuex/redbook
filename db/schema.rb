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

ActiveRecord::Schema.define(version: 20160919200741) do

  create_table "admin_users", force: :cascade do |t|
    t.string   "first_name",      limit: 50
    t.string   "last_name",       limit: 50
    t.string   "email",           limit: 255, default: "", null: false
    t.string   "password_digest", limit: 255
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  create_table "agencies", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "phonenum",   limit: 10
    t.string   "purpose",    limit: 250
    t.string   "website",    limit: 100
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name",        limit: 100, null: false
    t.string   "description", limit: 250
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "categories_programs", id: false, force: :cascade do |t|
    t.integer "category_id", limit: 4
    t.integer "program_id",  limit: 4
  end

  add_index "categories_programs", ["category_id", "program_id"], name: "index_categories_programs_on_category_id_and_program_id", using: :btree

  create_table "programs", force: :cascade do |t|
    t.integer  "agency_id",   limit: 4
    t.string   "name",        limit: 255,   null: false
    t.string   "shortdesc",   limit: 300,   null: false
    t.text     "description", limit: 65535
    t.text     "eligibility", limit: 65535
    t.string   "keywords",    limit: 255
    t.string   "phonenum",    limit: 10
    t.string   "email",       limit: 250
    t.string   "website",     limit: 100
    t.string   "pyaddress",   limit: 250
    t.string   "pycity",      limit: 60
    t.string   "pystate",     limit: 2
    t.string   "pyzip",       limit: 10
    t.string   "maddress",    limit: 250
    t.string   "maddress2",   limit: 250
    t.string   "mcity",       limit: 60
    t.string   "mstate",      limit: 2
    t.string   "mzip",        limit: 10
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "programs", ["agency_id"], name: "index_programs_on_agency_id", using: :btree

end
