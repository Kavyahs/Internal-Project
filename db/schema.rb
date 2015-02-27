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

ActiveRecord::Schema.define(version: 20150227051854) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "employees", force: true do |t|
    t.string   "employ_name"
    t.string   "phone_no"
    t.string   "projects_name"
    t.string   "department"
    t.text     "employ_information"
    t.string   "profile_picture"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "project_id"
    t.integer  "user_id"
  end

  add_index "employees", ["project_id"], name: "index_employees_on_project_id", using: :btree
  add_index "employees", ["user_id"], name: "index_employees_on_user_id", using: :btree

  create_table "projects", force: true do |t|
    t.string   "project_name"
    t.text     "projrct_description"
    t.text     "employees_name"
    t.text     "project_information"
    t.string   "project_icon"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "employee_id"
    t.integer  "user_id"
  end

  add_index "projects", ["employee_id"], name: "index_projects_on_employee_id", using: :btree
  add_index "projects", ["user_id"], name: "index_projects_on_user_id", using: :btree

  create_table "projects_employees", force: true do |t|
    t.integer  "project_id"
    t.integer  "employee_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "projects_employees", ["employee_id"], name: "index_projects_employees_on_employee_id", using: :btree
  add_index "projects_employees", ["project_id"], name: "index_projects_employees_on_project_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
  end

end
