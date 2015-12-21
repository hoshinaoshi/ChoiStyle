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

ActiveRecord::Schema.define(version: 20130916041132) do

  create_table "admin_users", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["user_id"], name: "index_admin_users_on_user_id", using: :btree

  create_table "billing_histories", force: true do |t|
    t.integer  "month"
    t.integer  "salon_id"
    t.integer  "stylist_id"
    t.integer  "total_amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "billing_histories", ["month"], name: "index_billing_histories_on_month", using: :btree
  add_index "billing_histories", ["salon_id"], name: "index_billing_histories_on_salon_id", using: :btree
  add_index "billing_histories", ["stylist_id"], name: "index_billing_histories_on_stylist_id", using: :btree

  create_table "chat_messages", force: true do |t|
    t.integer  "chat_id"
    t.integer  "user_type"
    t.text     "message"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "chat_messages", ["chat_id"], name: "index_chat_messages_on_chat_id", using: :btree

  create_table "chats", force: true do |t|
    t.integer  "offer_id"
    t.integer  "salon_id"
    t.integer  "stylist_id"
    t.integer  "cut_model_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "chats", ["cut_model_id"], name: "index_chats_on_cut_model_id", using: :btree
  add_index "chats", ["offer_id"], name: "index_chats_on_offer_id", using: :btree
  add_index "chats", ["salon_id"], name: "index_chats_on_salon_id", using: :btree
  add_index "chats", ["stylist_id"], name: "index_chats_on_stylist_id", using: :btree

  create_table "cut_model_images", force: true do |t|
    t.integer "cut_model_id"
    t.string  "image"
  end

  add_index "cut_model_images", ["cut_model_id"], name: "index_cut_model_images_on_cut_model_id", using: :btree

  create_table "cut_models", force: true do |t|
    t.integer  "user_id"
    t.integer  "prefecture",      default: 0
    t.integer  "area",            default: 0
    t.integer  "hair_long",       default: 0
    t.integer  "hair_type",       default: 0
    t.integer  "volume",          default: 0
    t.integer  "wavy",            default: 0
    t.integer  "when_parm",       default: 0
    t.integer  "when_color",      default: 0
    t.integer  "want_long",       default: 0
    t.integer  "want_style",      default: 0
    t.text     "want_style_text"
    t.integer  "can_style",       default: 0
    t.text     "can_style_text"
    t.text     "my_self"
    t.boolean  "deleted",         default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cut_models", ["area"], name: "index_cut_models_on_area", using: :btree
  add_index "cut_models", ["can_style"], name: "index_cut_models_on_can_style", using: :btree
  add_index "cut_models", ["hair_long"], name: "index_cut_models_on_hair_long", using: :btree
  add_index "cut_models", ["hair_type"], name: "index_cut_models_on_hair_type", using: :btree
  add_index "cut_models", ["prefecture"], name: "index_cut_models_on_prefecture", using: :btree
  add_index "cut_models", ["user_id"], name: "index_cut_models_on_user_id", using: :btree
  add_index "cut_models", ["volume"], name: "index_cut_models_on_volume", using: :btree
  add_index "cut_models", ["want_long"], name: "index_cut_models_on_want_long", using: :btree
  add_index "cut_models", ["want_style"], name: "index_cut_models_on_want_style", using: :btree
  add_index "cut_models", ["wavy"], name: "index_cut_models_on_wavy", using: :btree

  create_table "favorites", force: true do |t|
    t.integer  "user_id"
    t.integer  "salon_id"
    t.integer  "stylist_id"
    t.integer  "cut_model_id"
    t.boolean  "deleted",      default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "favorites", ["user_id"], name: "index_favorites_on_user_id", using: :btree

  create_table "offers", force: true do |t|
    t.integer  "salon_id"
    t.integer  "stylist_id"
    t.integer  "cut_model_id"
    t.integer  "status",       default: 0
    t.integer  "offer_type"
    t.string   "subject"
    t.text     "content"
    t.boolean  "deleted",      default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "offers", ["cut_model_id"], name: "index_offers_on_cut_model_id", using: :btree
  add_index "offers", ["deleted"], name: "index_offers_on_deleted", using: :btree
  add_index "offers", ["salon_id"], name: "index_offers_on_salon_id", using: :btree
  add_index "offers", ["status"], name: "index_offers_on_status", using: :btree
  add_index "offers", ["stylist_id"], name: "index_offers_on_stylist_id", using: :btree

  create_table "opinions", force: true do |t|
    t.integer "user_id"
    t.text    "opinion_content"
  end

  create_table "order_histories", force: true do |t|
    t.integer  "order_date"
    t.integer  "salon_id"
    t.integer  "stylist_id"
    t.integer  "order_amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "order_histories", ["order_date"], name: "index_order_histories_on_order_date", using: :btree
  add_index "order_histories", ["salon_id"], name: "index_order_histories_on_salon_id", using: :btree
  add_index "order_histories", ["stylist_id"], name: "index_order_histories_on_stylist_id", using: :btree

  create_table "salon_images", force: true do |t|
    t.integer "salon_id"
    t.string  "image"
  end

  add_index "salon_images", ["salon_id"], name: "index_salon_images_on_salon_id", using: :btree

  create_table "salons", force: true do |t|
    t.integer  "user_id"
    t.integer  "salon_prefecture", default: 0
    t.string   "salon_name"
    t.string   "salon_url"
    t.string   "salon_tel"
    t.string   "salon_location"
    t.integer  "salon_area",       default: 0
    t.string   "salon_zip"
    t.string   "salon_station"
    t.string   "billing_zip"
    t.string   "billing_location"
    t.boolean  "deleted",          default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "salons", ["salon_prefecture"], name: "index_salons_on_salon_prefecture", using: :btree
  add_index "salons", ["user_id"], name: "index_salons_on_user_id", using: :btree

  create_table "stylist_images", force: true do |t|
    t.integer "stylist_id"
    t.string  "image"
  end

  add_index "stylist_images", ["stylist_id"], name: "index_stylist_images_on_stylist_id", using: :btree

  create_table "stylists", force: true do |t|
    t.integer  "user_id"
    t.integer  "salon_id"
    t.string   "name"
    t.integer  "gender",            default: 0
    t.string   "nick_name"
    t.integer  "target",            default: 0
    t.integer  "base_price",        default: 0
    t.integer  "want_long",         default: 0
    t.integer  "want_style",        default: 0
    t.text     "want_style_text"
    t.integer  "can_style",         default: 0
    t.text     "can_style_text"
    t.text     "my_self"
    t.integer  "salon_prefecture",  default: 0
    t.string   "salon_name"
    t.string   "salon_url"
    t.string   "salon_tel"
    t.string   "salon_zip"
    t.string   "salon_location"
    t.integer  "salon_area",        default: 0
    t.string   "salon_station"
    t.string   "billing_zip"
    t.string   "billing_location"
    t.boolean  "deleted",           default: false
    t.integer  "order_amount",      default: 0
    t.boolean  "order_update_flag", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stylists", ["salon_area"], name: "index_stylists_on_salon_area", using: :btree
  add_index "stylists", ["salon_id"], name: "index_stylists_on_salon_id", using: :btree
  add_index "stylists", ["salon_prefecture"], name: "index_stylists_on_salon_prefecture", using: :btree
  add_index "stylists", ["target"], name: "index_stylists_on_target", using: :btree
  add_index "stylists", ["user_id"], name: "index_stylists_on_user_id", using: :btree
  add_index "stylists", ["want_long"], name: "index_stylists_on_want_long", using: :btree
  add_index "stylists", ["want_style"], name: "index_stylists_on_want_style", using: :btree

  create_table "users", force: true do |t|
    t.string   "name",                      default: "", null: false
    t.string   "nick_name",                 default: "", null: false
    t.integer  "user_type"
    t.integer  "gender",                    default: 0,  null: false
    t.integer  "quit_flag",                 default: 0,  null: false
    t.string   "provider",                               null: false
    t.integer  "u_id",            limit: 8,              null: false
    t.string   "u_name",                    default: "", null: false
    t.string   "token",                                  null: false
    t.string   "secret_token"
    t.datetime "last_sign_in_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["gender"], name: "index_users_on_gender", using: :btree
  add_index "users", ["provider"], name: "index_users_on_provider", using: :btree
  add_index "users", ["u_id"], name: "index_users_on_u_id", using: :btree
  add_index "users", ["user_type"], name: "index_users_on_user_type", using: :btree

end
