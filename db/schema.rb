# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_10_12_210824) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "calendar_event", force: :cascade do |t|
    t.bigint "event_id", null: false
    t.bigint "organiser_id", null: false
    t.bigint "customer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_calendar_event_on_customer_id"
    t.index ["event_id"], name: "index_calendar_event_on_event_id"
    t.index ["organiser_id"], name: "index_calendar_event_on_organiser_id"
  end

  create_table "calendar_events", force: :cascade do |t|
    t.bigint "event_id", null: false
    t.bigint "organiser_id", null: false
    t.bigint "customer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_calendar_events_on_customer_id"
    t.index ["event_id"], name: "index_calendar_events_on_event_id"
    t.index ["organiser_id"], name: "index_calendar_events_on_organiser_id"
  end

  create_table "customer", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.integer "phone_number"
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.integer "phone_number"
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "category"
    t.string "image_url"
    t.date "date"
    t.time "start_time"
    t.time "end_time"
    t.string "venue_name"
    t.string "event_location"
    t.integer "available_tickets_count"
    t.bigint "organiser_id", null: false
    t.bigint "customer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_event_on_customer_id"
    t.index ["organiser_id"], name: "index_event_on_organiser_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "category"
    t.string "image_url"
    t.date "date"
    t.time "start_time"
    t.time "end_time"
    t.string "venue_name"
    t.string "event_location"
    t.integer "available_tickets_count"
    t.bigint "organiser_id", null: false
    t.bigint "customer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_events_on_customer_id"
    t.index ["organiser_id"], name: "index_events_on_organiser_id"
  end

  create_table "organiser", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.integer "phone_number"
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "organisers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.integer "phone_number"
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payment", force: :cascade do |t|
    t.integer "amount"
    t.string "transaction_id"
    t.string "status"
    t.datetime "timestamp"
    t.bigint "event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_payment_on_event_id"
  end

  create_table "payments", force: :cascade do |t|
    t.integer "amount"
    t.string "transaction_id"
    t.string "status"
    t.datetime "timestamp"
    t.bigint "event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_payments_on_event_id"
  end

  add_foreign_key "calendar_event", "customers"
  add_foreign_key "calendar_event", "events"
  add_foreign_key "calendar_event", "organisers"
  add_foreign_key "calendar_events", "customers"
  add_foreign_key "calendar_events", "events"
  add_foreign_key "calendar_events", "organisers"
  add_foreign_key "event", "customers"
  add_foreign_key "event", "organisers"
  add_foreign_key "events", "customers"
  add_foreign_key "events", "organisers"
  add_foreign_key "payment", "events"
  add_foreign_key "payments", "events"
end
