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

ActiveRecord::Schema.define(version: 2019_05_28_231716) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "charges", force: :cascade do |t|
    t.string "customer_id"
    t.string "customer_email"
    t.string "stripe_payment_token"
    t.string "charge_id"
    t.integer "charge_amount"
    t.string "charge_description"
    t.boolean "charge_paid"
    t.integer "pickup_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "drivers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "scout_names"
    t.string "street_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pickups", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "street_address"
    t.string "message"
    t.integer "driver_id"
    t.string "size"
    t.string "key", null: false
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "settings", force: :cascade do |t|
    t.text "pickup_instructions", default: "Boy Scouts from our Troop will be picking up between 8am and 2pm on Saturday, June 2. Please have your e-waste outside on your curb, house porch, or in front of your garage or front door."
    t.boolean "pickup_signups_enabled", default: false
    t.boolean "donations_enabled", default: false
    t.boolean "allow_user_signups", default: true
    t.string "general_contact_name"
    t.string "general_contact_email"
    t.string "pickup_contact_name"
    t.string "pickup_contact_email"
    t.string "new_user_key"
    t.date "event_date"
    t.datetime "pickups_start_at"
    t.datetime "pickups_end_at"
    t.datetime "dropoffs_start_at"
    t.datetime "dropoffs_end_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "send_admin_pickup_notifications"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", null: false
    t.string "encrypted_password", limit: 128, null: false
    t.string "confirmation_token", limit: 128
    t.string "remember_token", limit: 128, null: false
    t.index ["email"], name: "index_users_on_email"
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

end
