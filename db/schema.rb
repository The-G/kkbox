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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20171214062445) do
=======
ActiveRecord::Schema.define(version: 20171214085050) do
>>>>>>> feature/kwonb

  create_table "churns", force: :cascade do |t|
    t.string   "msno"
    t.date     "date"
    t.integer  "predict"
    t.integer  "actual"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", force: :cascade do |t|
    t.string   "msno"
    t.string   "city"
    t.integer  "bd"
    t.string   "gender"
    t.date     "registered_via"
    t.date     "registration_init_time"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.string   "msno"
    t.integer  "payment"
    t.integer  "payment_plan_days"
    t.integer  "plan_list_price"
    t.integer  "actual_amount_paid"
    t.integer  "is_auto_renew"
    t.date     "transaction_date"
    t.date     "membership_expire_date"
    t.integer  "is_cancel"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
<<<<<<< HEAD
=======
    t.integer  "is_churn"
    t.integer  "is_predictedChurn"
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
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "role"
>>>>>>> feature/kwonb
  end

end
