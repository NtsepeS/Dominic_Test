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

ActiveRecord::Schema.define(version: 20150210085349) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "albums", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "antennas", force: :cascade do |t|
    t.string   "size"
    t.integer  "serial_number"
    t.integer  "is_asset_tag"
    t.string   "latitude"
    t.string   "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "base_station_sectors", force: :cascade do |t|
    t.string   "name"
    t.integer  "status_id"
    t.integer  "base_station_unit_id"
    t.integer  "sector"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "base_station_sectors", ["base_station_unit_id"], name: "index_base_station_sectors_on_base_station_unit_id", using: :btree
  add_index "base_station_sectors", ["status_id"], name: "index_base_station_sectors_on_status_id", using: :btree

  create_table "base_station_units", force: :cascade do |t|
    t.string   "name"
    t.integer  "status_id"
    t.integer  "core_node_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "base_station_units", ["status_id"], name: "index_base_station_units_on_status_id", using: :btree

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "client_links", force: :cascade do |t|
    t.string   "name"
    t.string   "branch"
    t.string   "circuit_number"
    t.string   "msad_number"
    t.date     "activation_date"
    t.string   "mac_address"
    t.string   "distance"
    t.integer  "client_id"
    t.integer  "status_id"
    t.integer  "network_operator_id"
    t.integer  "link_type_id"
    t.integer  "base_station_sector_id"
    t.integer  "antenna_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "solution_identifier"
    t.string   "billing_account"
    t.string   "service_account"
    t.string   "service_account_site"
  end

  add_index "client_links", ["antenna_id"], name: "index_client_links_on_antenna_id", using: :btree
  add_index "client_links", ["base_station_sector_id"], name: "index_client_links_on_base_station_sector_id", using: :btree
  add_index "client_links", ["client_id"], name: "index_client_links_on_client_id", using: :btree
  add_index "client_links", ["link_type_id"], name: "index_client_links_on_link_type_id", using: :btree
  add_index "client_links", ["network_operator_id"], name: "index_client_links_on_network_operator_id", using: :btree
  add_index "client_links", ["status_id"], name: "index_client_links_on_status_id", using: :btree

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "core_nodes", force: :cascade do |t|
    t.string   "name"
    t.integer  "status_id"
    t.integer  "city_id"
    t.string   "latitude"
    t.string   "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "core_nodes", ["city_id"], name: "index_core_nodes_on_city_id", using: :btree
  add_index "core_nodes", ["status_id"], name: "index_core_nodes_on_status_id", using: :btree

  create_table "equipment", force: :cascade do |t|
    t.string   "name"
    t.string   "is_asset_tag"
    t.integer  "equipped_id"
    t.string   "equipped_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "equipment", ["equipped_type", "equipped_id"], name: "index_equipment_on_equipped_type_and_equipped_id", using: :btree

  create_table "group_classifications", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "link_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "modems", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "network_operators", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pictures", force: :cascade do |t|
    t.string   "mechanism"
    t.string   "picture_data"
    t.datetime "date_taken"
    t.integer  "album_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "pictures", ["album_id"], name: "index_pictures_on_album_id", using: :btree

  create_table "radios", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "statuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sub_group_classifications", force: :cascade do |t|
    t.string   "name"
    t.integer  "group_classification_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "sub_group_classifications", ["group_classification_id"], name: "index_sub_group_classifications_on_group_classification_id", using: :btree

  create_table "sub_group_picture_sets", force: :cascade do |t|
    t.integer  "album_id"
    t.integer  "sub_group_classification_id"
    t.integer  "client_link_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "sub_group_picture_sets", ["album_id"], name: "index_sub_group_picture_sets_on_album_id", using: :btree
  add_index "sub_group_picture_sets", ["client_link_id"], name: "index_sub_group_picture_sets_on_client_link_id", using: :btree
  add_index "sub_group_picture_sets", ["sub_group_classification_id"], name: "index_sub_group_picture_sets_on_sub_group_classification_id", using: :btree

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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "ad_username"
    t.string   "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",      null: false
    t.integer  "item_id",        null: false
    t.string   "event",          null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
    t.text     "object_changes"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

  add_foreign_key "pictures", "albums"
  add_foreign_key "sub_group_classifications", "group_classifications"
  add_foreign_key "sub_group_picture_sets", "albums"
  add_foreign_key "sub_group_picture_sets", "client_links"
  add_foreign_key "sub_group_picture_sets", "sub_group_classifications"
end
