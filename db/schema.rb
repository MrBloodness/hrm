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

ActiveRecord::Schema.define(version: 20190522141327) do

  create_table "classifier_permissions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id"
    t.integer "user_classifier_id"
    t.index ["user_classifier_id"], name: "index_classifier_permissions_on_user_classifier_id", using: :btree
    t.index ["user_id"], name: "index_classifier_permissions_on_user_id", using: :btree
  end

  create_table "documents", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "number"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.bigint   "file_file_size"
    t.datetime "file_updated_at"
    t.string   "title"
    t.date     "document_date"
    t.date     "deadline_date"
    t.text     "description",          limit: 65535
    t.integer  "user_id"
    t.integer  "employee_id"
    t.integer  "document_category_id"
    t.integer  "document_state_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.index ["document_category_id"], name: "index_documents_on_document_category_id", using: :btree
    t.index ["document_state_id"], name: "index_documents_on_document_state_id", using: :btree
    t.index ["employee_id"], name: "index_documents_on_employee_id", using: :btree
    t.index ["user_id"], name: "index_documents_on_user_id", using: :btree
  end

  create_table "employees", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.integer  "state_id"
    t.string   "internal_phone"
    t.string   "mobile_phone"
    t.string   "external_phone"
    t.string   "private_phone"
    t.text     "actual_address",          limit: 65535
    t.text     "legal_address",           limit: 65535
    t.date     "employed_since"
    t.decimal  "salary",                                precision: 6, scale: 2
    t.string   "bank_name"
    t.string   "bank_account"
    t.integer  "worktime"
    t.boolean  "available",                                                     default: true
    t.string   "nonstandart_worktime"
    t.integer  "unused_vacation_days"
    t.date     "vacation_start_date"
    t.integer  "remaining_vacation_days"
    t.datetime "created_at",                                                                   null: false
    t.datetime "updated_at",                                                                   null: false
  end

  create_table "user_classifiers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "type"
    t.string   "value"
    t.boolean  "is_active",  default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
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
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "work_logs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "employee_id"
    t.decimal  "spent_time",                     precision: 10, scale: 2
    t.integer  "work_log_type_id"
    t.date     "log_date"
    t.text     "comment",          limit: 65535
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
    t.index ["employee_id"], name: "index_work_logs_on_employee_id", using: :btree
    t.index ["work_log_type_id"], name: "index_work_logs_on_work_log_type_id", using: :btree
  end

end
