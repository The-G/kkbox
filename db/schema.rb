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

ActiveRecord::Schema.define(version: 20171213135517) do

  create_table "comments", force: :cascade do |t|
    t.string   "name"
    t.string   "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", force: :cascade do |t|
    t.string   "msno"
    t.integer  "city"
    t.integer  "bd"
    t.string   "gender"
    t.integer  "registered_via"
    t.date     "registration_init_time"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "timelines", force: :cascade do |t|
    t.string   "subject"
    t.string   "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
  end

end
