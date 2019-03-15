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

ActiveRecord::Schema.define(version: 2019_03_15_220240) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ai_messages", force: :cascade do |t|
    t.string "message"
    t.bigint "campaign_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_id"], name: "index_ai_messages_on_campaign_id"
  end

  create_table "all_jokes", force: :cascade do |t|
    t.string "joke"
    t.integer "joke_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sequence"
    t.integer "uuid"
  end

  create_table "blocked_numbers", force: :cascade do |t|
    t.bigint "twilio_phone_number_id"
    t.bigint "victim_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["twilio_phone_number_id"], name: "index_blocked_numbers_on_twilio_phone_number_id"
    t.index ["victim_id"], name: "index_blocked_numbers_on_victim_id"
  end

  create_table "campaigns", force: :cascade do |t|
    t.integer "number_of_jokes"
    t.integer "duration"
    t.integer "campaign_type"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_campaigns_on_user_id"
  end

  create_table "payment_infos", force: :cascade do |t|
    t.string "stripe_token"
    t.string "last_four_digits"
    t.string "card_type"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_payment_infos_on_user_id"
  end

  create_table "payment_refund_transactions", force: :cascade do |t|
    t.integer "amount"
    t.string "stripe_refund_id"
    t.bigint "payment_transaction_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["payment_transaction_id"], name: "index_payment_refund_transactions_on_payment_transaction_id"
  end

  create_table "payment_transactions", force: :cascade do |t|
    t.integer "amount"
    t.string "stripe_transaction_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_payment_transactions_on_user_id"
  end

  create_table "twilio_phone_numbers", force: :cascade do |t|
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "used_jokes", force: :cascade do |t|
    t.bigint "all_joke_id"
    t.bigint "campaign_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["all_joke_id"], name: "index_used_jokes_on_all_joke_id"
    t.index ["campaign_id"], name: "index_used_jokes_on_campaign_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password"
    t.integer "credits"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "victim_replies", force: :cascade do |t|
    t.string "reply"
    t.bigint "campaign_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_id"], name: "index_victim_replies_on_campaign_id"
  end

  create_table "victims", force: :cascade do |t|
    t.string "name"
    t.string "phone_number"
    t.bigint "campaign_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_id"], name: "index_victims_on_campaign_id"
  end

  add_foreign_key "ai_messages", "campaigns"
  add_foreign_key "blocked_numbers", "twilio_phone_numbers"
  add_foreign_key "blocked_numbers", "victims"
  add_foreign_key "campaigns", "users"
  add_foreign_key "payment_infos", "users"
  add_foreign_key "payment_refund_transactions", "payment_transactions"
  add_foreign_key "payment_transactions", "users"
  add_foreign_key "used_jokes", "all_jokes"
  add_foreign_key "used_jokes", "campaigns"
  add_foreign_key "victim_replies", "campaigns"
  add_foreign_key "victims", "campaigns"
end
