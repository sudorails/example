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

ActiveRecord::Schema.define(version: 20150308084438) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "address_serveys", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "customer_id"
    t.integer  "tab_id"
    t.boolean  "accept_or_decline"
    t.string   "agency_name"
    t.date     "date_of_visit"
    t.boolean  "marital_status"
    t.string   "person_contacted"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.boolean  "address_confirmed"
  end

  create_table "address_verifications", force: :cascade do |t|
    t.string   "father_name"
    t.date     "dob"
    t.string   "location"
    t.text     "address_one"
    t.text     "address_two"
    t.text     "address_third"
    t.integer  "customer_id"
    t.string   "status"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "assigned_addresses", force: :cascade do |t|
    t.integer  "tab_id"
    t.integer  "user_id"
    t.integer  "customer_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "crime_verifications", force: :cascade do |t|
    t.string   "father_name"
    t.date     "dob"
    t.string   "location"
    t.text     "address_one"
    t.text     "address_two"
    t.text     "address_third"
    t.integer  "customer_id"
    t.string   "status"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "customer_documents", force: :cascade do |t|
    t.string   "doc_name"
    t.integer  "customer_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
  end

  create_table "customer_verifications", force: :cascade do |t|
    t.integer  "tab_id"
    t.integer  "customer_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "reference_id",         default: 1
    t.string   "slug"
    t.string   "request_id"
    t.integer  "verification_type_id"
    t.string   "status"
    t.string   "father_name"
    t.date     "dob"
    t.string   "location"
    t.text     "address"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "education_verifications", force: :cascade do |t|
    t.string   "stream"
    t.integer  "month"
    t.integer  "year"
    t.integer  "customer_id"
    t.string   "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "seat_number"
  end

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "full_name"
    t.string   "contact_number"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tabs", force: :cascade do |t|
    t.string   "name"
    t.string   "tab_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "role_id"
    t.integer  "tab_id"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "verification_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
