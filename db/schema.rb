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

ActiveRecord::Schema.define do

  migrations do
    migration 20121204215207, "", ""
    migration 20121205012836, "", ""
    migration 20121205234749, "", ""
    migration 20121210131049, "609b96435f1e476335b6fdacfaabf723", "create_payments"
    migration 20121211052741, "5233caecc306b4951fcf8c5ceb74be99", "add_credit_to_expenses"
  end

  create_table "expenses", force: true do |t|
    t.decimal  "amount"
    t.integer  "day_of_month"
    t.boolean  "recurring"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "start_date"
    t.decimal  "interst_rate"
    t.boolean  "credit_account"
    t.decimal  "interest_rate"
    t.decimal  "balance"
  end

  create_table "incomes", force: true do |t|
    t.decimal  "amount"
    t.integer  "day_of_month"
    t.boolean  "recurring"
    t.integer  "every_x_weeks"
    t.date     "start_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payments", force: true do |t|
    t.integer  "expense_id"
    t.date     "pay_date"
    t.decimal  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "payments", ["expense_id"], name: "index_payments_on_expense_id"

end
