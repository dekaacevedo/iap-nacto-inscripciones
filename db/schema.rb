# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_12_10_173136) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "attendants", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "rut"
    t.string "phone"
    t.string "email"
    t.string "seat"
    t.bigint "event_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "temperature"
    t.index ["event_id"], name: "index_attendants_on_event_id"
  end

  create_table "attendee_declarations", force: :cascade do |t|
    t.string "rut"
    t.string "qa"
    t.string "qb"
    t.string "qc"
    t.string "qd1"
    t.string "qd2"
    t.string "qd3"
    t.string "qe1"
    t.string "qe2"
    t.string "qe3"
    t.string "qe4"
    t.string "qe5"
    t.string "qe6"
    t.string "qe7"
    t.string "qe8"
    t.bigint "event_attendee_id", null: false
    t.bigint "event_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_attendee_id"], name: "index_attendee_declarations_on_event_attendee_id"
    t.index ["event_id"], name: "index_attendee_declarations_on_event_id"
  end

  create_table "attendees", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "rut"
    t.string "phone"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "collab_declarations", force: :cascade do |t|
    t.string "rut"
    t.string "qa"
    t.string "qb"
    t.string "qc"
    t.string "qd1"
    t.string "qd2"
    t.string "qd3"
    t.string "qe1"
    t.string "qe2"
    t.string "qe3"
    t.string "qe4"
    t.string "qe5"
    t.string "qe6"
    t.string "qe7"
    t.string "qe8"
    t.bigint "event_collaborator_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "event_id", null: false
    t.index ["event_collaborator_id"], name: "index_collab_declarations_on_event_collaborator_id"
    t.index ["event_id"], name: "index_collab_declarations_on_event_id"
  end

  create_table "collab_seats", force: :cascade do |t|
    t.string "seat"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "collaborators", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "rut"
    t.string "phone"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "declarations", force: :cascade do |t|
    t.string "rut"
    t.boolean "qa"
    t.boolean "qb"
    t.boolean "qc"
    t.boolean "qd1"
    t.boolean "qd2"
    t.boolean "qd3"
    t.boolean "qe1"
    t.boolean "qe2"
    t.boolean "qe3"
    t.boolean "qe4"
    t.boolean "qe5"
    t.boolean "qe6"
    t.boolean "qe7"
    t.boolean "qe8"
    t.bigint "attendant_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "event_id", null: false
    t.index ["attendant_id"], name: "index_declarations_on_attendant_id"
    t.index ["event_id"], name: "index_declarations_on_event_id"
  end

  create_table "event_attendees", force: :cascade do |t|
    t.bigint "event_id", null: false
    t.bigint "attendee_id", null: false
    t.string "seat"
    t.string "temperature"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["attendee_id"], name: "index_event_attendees_on_attendee_id"
    t.index ["event_id"], name: "index_event_attendees_on_event_id"
  end

  create_table "event_collaborators", force: :cascade do |t|
    t.bigint "event_id", null: false
    t.bigint "collaborator_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "seat"
    t.string "temperature"
    t.index ["collaborator_id"], name: "index_event_collaborators_on_collaborator_id"
    t.index ["event_id"], name: "index_event_collaborators_on_event_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.date "date"
    t.integer "quantity"
    t.string "seats", array: true
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "collabs"
    t.string "collab_seat", array: true
    t.index ["seats"], name: "index_events_on_seats", using: :gin
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "rut"
    t.string "phone"
    t.boolean "admin", default: false
    t.boolean "ficha", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "attendants", "events"
  add_foreign_key "attendee_declarations", "event_attendees"
  add_foreign_key "attendee_declarations", "events"
  add_foreign_key "collab_declarations", "event_collaborators"
  add_foreign_key "collab_declarations", "events"
  add_foreign_key "declarations", "attendants"
  add_foreign_key "declarations", "events"
  add_foreign_key "event_attendees", "attendees"
  add_foreign_key "event_attendees", "events"
  add_foreign_key "event_collaborators", "collaborators"
  add_foreign_key "event_collaborators", "events"
  add_foreign_key "events", "users"
end
