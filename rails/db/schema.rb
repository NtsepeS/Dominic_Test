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

ActiveRecord::Schema.define(version: 20150320104751) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "albums", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "antenna_parameters", force: :cascade do |t|
    t.string   "polarization"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "antennas", force: :cascade do |t|
    t.string   "size"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "location_id"
    t.string   "item_code"
    t.string   "serial_number"
    t.string   "is_asset_tag"
    t.string   "product_number"
    t.integer  "client_link_id"
  end

  add_index "antennas", ["client_link_id"], name: "index_antennas_on_client_link_id", using: :btree
  add_index "antennas", ["location_id"], name: "index_antennas_on_location_id", using: :btree

  create_table "authorizations", force: :cascade do |t|
    t.string   "email",      null: false
    t.string   "name",       null: false
    t.string   "invited_by", null: false
    t.string   "invite_id"
    t.string   "role",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "base_station_sectors", force: :cascade do |t|
    t.string   "name"
    t.integer  "status_id"
    t.integer  "sector"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "base_station_sectors", ["status_id"], name: "index_base_station_sectors_on_status_id", using: :btree

  create_table "base_station_units", force: :cascade do |t|
    t.string   "name"
    t.integer  "status_id"
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "solution_identifier"
    t.string   "billing_account"
    t.string   "service_account"
    t.string   "service_account_site"
    t.integer  "radio_id"
  end

  add_index "client_links", ["client_id"], name: "index_client_links_on_client_id", using: :btree
  add_index "client_links", ["link_type_id"], name: "index_client_links_on_link_type_id", using: :btree
  add_index "client_links", ["network_operator_id"], name: "index_client_links_on_network_operator_id", using: :btree
  add_index "client_links", ["radio_id"], name: "index_client_links_on_radio_id", using: :btree
  add_index "client_links", ["status_id"], name: "index_client_links_on_status_id", using: :btree

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "containers", force: :cascade do |t|
    t.integer "parent_id"
    t.integer "lft",              null: false
    t.integer "rgt",              null: false
    t.integer "containable_id"
    t.string  "containable_type"
  end

  add_index "containers", ["containable_type", "containable_id"], name: "index_containers_on_containable_type_and_containable_id", using: :btree
  add_index "containers", ["lft"], name: "index_containers_on_lft", using: :btree
  add_index "containers", ["parent_id"], name: "index_containers_on_parent_id", using: :btree
  add_index "containers", ["rgt"], name: "index_containers_on_rgt", using: :btree

  create_table "controller_cards", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "core_nodes", force: :cascade do |t|
    t.string   "name"
    t.integer  "status_id"
    t.integer  "city_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "location_id"
  end

  add_index "core_nodes", ["city_id"], name: "index_core_nodes_on_city_id", using: :btree
  add_index "core_nodes", ["location_id"], name: "index_core_nodes_on_location_id", using: :btree
  add_index "core_nodes", ["status_id"], name: "index_core_nodes_on_status_id", using: :btree

  create_table "geometries", force: :cascade do |t|
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.decimal  "altitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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

  create_table "locations", force: :cascade do |t|
    t.integer  "geometry_id"
    t.integer  "vicinity_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "locations", ["geometry_id"], name: "index_locations_on_geometry_id", using: :btree
  add_index "locations", ["vicinity_id"], name: "index_locations_on_vicinity_id", using: :btree

  create_table "modems", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "serial_number"
    t.string   "is_asset_tag"
    t.string   "product_number"
    t.integer  "client_link_id"
  end

  add_index "modems", ["client_link_id"], name: "index_modems_on_client_link_id", using: :btree

  create_table "modulations", force: :cascade do |t|
    t.string   "downlink_min"
    t.string   "downlink_max"
    t.string   "uplink_min"
    t.string   "uplink_max"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "radio_id"
    t.string   "modulation_result_set"
  end

  add_index "modulations", ["radio_id"], name: "index_modulations_on_radio_id", using: :btree

  create_table "network_operators", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "operating_parameters", force: :cascade do |t|
    t.integer  "location_id"
    t.integer  "parameterized_id"
    t.string   "parameterized_type"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "operating_parameters", ["location_id"], name: "index_operating_parameters_on_location_id", using: :btree
  add_index "operating_parameters", ["parameterized_id", "parameterized_type"], name: "index_operatingparameters_on_parameterized_type_and_id", using: :btree

  create_table "pictures", force: :cascade do |t|
    t.string   "mechanism"
    t.string   "picture_data"
    t.datetime "date_taken"
    t.integer  "album_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "width"
    t.string   "height"
  end

  add_index "pictures", ["album_id"], name: "index_pictures_on_album_id", using: :btree

  create_table "ports", force: :cascade do |t|
    t.string   "vlan_type"
    t.string   "acceptable_frame_type"
    t.string   "default_vlan"
    t.integer  "service_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ports", ["service_id"], name: "index_ports_on_service_id", using: :btree

  create_table "radios", force: :cascade do |t|
    t.string   "name"
    t.string   "item_code"
    t.boolean  "icasa_sticker"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "serial_number"
    t.string   "is_asset_tag"
    t.string   "product_number"
    t.integer  "client_link_id"
  end

  add_index "radios", ["client_link_id"], name: "index_radios_on_client_link_id", using: :btree

  create_table "rf_performance_parameters", force: :cascade do |t|
    t.float    "uplink_rssi"
    t.float    "downlink_rssi"
    t.float    "uplink_cnr"
    t.float    "downlink_cnr"
    t.float    "tx_power"
    t.float    "step_attenuator"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "radio_id"
    t.string   "rf_result_set"
  end

  add_index "rf_performance_parameters", ["radio_id"], name: "index_rf_performance_parameters_on_radio_id", using: :btree

  create_table "service_fragments", force: :cascade do |t|
    t.string   "work_order_number"
    t.decimal  "line_speed"
    t.string   "service_type"
    t.string   "physical_mode"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "client_link_id"
  end

  create_table "services", force: :cascade do |t|
    t.string   "linetag"
    t.decimal  "line_speed"
    t.text     "vlan"
    t.integer  "service_fragment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "services", ["service_fragment_id"], name: "index_services_on_service_fragment_id", using: :btree

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
    t.string   "email",               default: "", null: false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       default: 0,  null: false
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

  create_table "vicinities", force: :cascade do |t|
    t.text     "physical_address"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_foreign_key "locations", "geometries"
  add_foreign_key "locations", "vicinities"
  add_foreign_key "operating_parameters", "locations"
  add_foreign_key "pictures", "albums"
  add_foreign_key "sub_group_classifications", "group_classifications"
  add_foreign_key "sub_group_picture_sets", "albums"
  add_foreign_key "sub_group_picture_sets", "client_links"
  add_foreign_key "sub_group_picture_sets", "sub_group_classifications"
end
