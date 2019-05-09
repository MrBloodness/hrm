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

ActiveRecord::Schema.define(version: 20190509075616) do

  create_table "classifier_permissions", force: :cascade do |t|
    t.integer "user_id"
    t.integer "user_classifier_id"
    t.index ["user_classifier_id"], name: "index_classifier_permissions_on_user_classifier_id"
    t.index ["user_id"], name: "index_classifier_permissions_on_user_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.integer  "state_id"
    t.string   "internal_phone"
    t.string   "mobile_phone"
    t.string   "external_phone"
    t.string   "private_phone"
    t.text     "actual_address"
    t.text     "legal_address"
    t.date     "employed_since"
    t.decimal  "salary",                  precision: 6, scale: 2
    t.string   "bank_name"
    t.string   "bank_account"
    t.integer  "worktime"
    t.boolean  "available",                                       default: true
    t.string   "nonstandart_worktime"
    t.integer  "unused_vacation_days"
    t.date     "vacation_start_date"
    t.integer  "remaining_vacation_days"
    t.datetime "created_at",                                                     null: false
    t.datetime "updated_at",                                                     null: false
  end

  create_table "user_classifiers", force: :cascade do |t|
    t.string   "type"
    t.boolean  "is_system",            default: false
    t.boolean  "is_active",            default: true
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "position",   limit: 4,                 null: false
    t.string   "key"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                                          default: "", null: false
    t.string   "encrypted_password",                             default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "occupation_id"
    t.integer  "state_id"
    t.integer  "department_id"
    t.date     "employed_since"
    t.decimal  "salary",                 precision: 6, scale: 2
    t.string   "avatar_file_name"
    t.integer  "sign_in_count",                                  default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                                  null: false
    t.datetime "updated_at",                                                  null: false
    t.string   "first_name"
    t.string   "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "work_logs", force: :cascade do |t|
    t.integer  "employee_id"
    t.decimal  "spent_time",  precision: 10, scale: 2
    t.string   "type"
    t.date     "log_date"
    t.text     "comment"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.index ["employee_id"], name: "index_work_logs_on_employee_id"
  end

end
