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

ActiveRecord::Schema.define(version: 20170615144954) do

  create_table "crono_jobs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.string   "job_id",                               null: false
    t.text     "log",               limit: 4294967295
    t.datetime "last_performed_at"
    t.boolean  "healthy"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.index ["job_id"], name: "index_crono_jobs_on_job_id", unique: true, using: :btree
  end

  create_table "orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.string   "user_id"
    t.string   "exchange_type"
    t.string   "frequency_type"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "order_name"
    t.float    "amount",            limit: 24
    t.boolean  "verified_order"
    t.string   "verification_code"
    t.float    "rate",              limit: 24
    t.datetime "last_order_time"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.string   "firstName"
    t.string   "lastName"
    t.string   "email"
    t.string   "countryCode"
    t.string   "phoneNumber"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.string   "password_digest"
    t.boolean  "verified"
    t.integer  "tier_level"
    t.string   "verification_code"
    t.integer  "selected_order_id"
    t.string   "api_key"
    t.string   "api_secret_key"
    t.string   "encrypted_api_key"
    t.string   "encrypted_api_secret_key"
    t.string   "encrypted_api_key_iv"
    t.string   "encrypted_api_secret_key_iv"
    t.string   "activation_digest"
    t.boolean  "activated",                   default: false
    t.datetime "activated_at"
    t.string   "remember_digest"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
  end

end
