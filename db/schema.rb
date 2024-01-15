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

ActiveRecord::Schema[7.1].define(version: 2024_01_15_070437) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parcels", force: :cascade do |t|
    t.float "weight", default: 0.0
    t.float "volume", default: 0.0
    t.integer "status", default: 0
    t.bigint "owner_id", null: false
    t.bigint "train_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_parcels_on_owner_id"
    t.index ["train_id"], name: "index_parcels_on_train_id"
  end

  create_table "tracks", force: :cascade do |t|
    t.string "name"
    t.integer "status", default: 0
    t.bigint "train_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["train_id"], name: "index_tracks_on_train_id"
  end

  create_table "trains", force: :cascade do |t|
    t.string "name"
    t.float "cost", default: 0.0
    t.integer "status", default: 0
    t.float "weight_capacity", default: 0.0
    t.float "volume_capacity", default: 0.0
    t.datetime "departure_time"
    t.bigint "operator_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "assigned_tracks", default: [], array: true
    t.index ["operator_id"], name: "index_trains_on_operator_id"
  end

  add_foreign_key "parcels", "accounts", column: "owner_id"
  add_foreign_key "parcels", "trains"
  add_foreign_key "tracks", "trains"
  add_foreign_key "trains", "accounts", column: "operator_id"
end
