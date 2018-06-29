# This file is auto-generated from the current state of the database. Instead


ActiveRecord::Schema.define(version: 20180629020548) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "lists", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "priority"
    t.datetime "deadline"
    t.boolean "complete"
    t.integer "duration"
    t.boolean "favorite"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "list_id"
  end

end
