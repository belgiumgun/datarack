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

ActiveRecord::Schema.define(version: 20131028131505) do

  create_table "fileracks", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "score"
    t.string   "datafile_file_name"
    t.string   "datafile_content_type"
    t.integer  "datafile_file_size"
    t.datetime "datafile_updated_at"
  end

  create_table "resumes", force: true do |t|
    t.string   "candidate_name"
    t.string   "location"
    t.string   "email"
    t.string   "phone"
    t.string   "overall_experience"
    t.string   "relevant_experience"
    t.string   "current_ctc"
    t.string   "expected_ctc"
    t.string   "notice_period"
    t.string   "relocation"
    t.string   "availablity"
    t.string   "remarks"
    t.string   "submitted_by"
    t.string   "source"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file_id"
    t.string   "field1"
    t.string   "skills"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
