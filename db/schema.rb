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

ActiveRecord::Schema[7.1].define(version: 2024_05_02_130319) do
  create_table "robot_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "robots", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "robot_type_id"
    t.index ["robot_type_id"], name: "index_robots_on_robot_type_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "description"
    t.integer "eta"
    t.boolean "completed", default: false
    t.integer "robot_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "robot_type_id"
    t.index ["robot_id"], name: "index_tasks_on_robot_id"
    t.index ["robot_type_id"], name: "index_tasks_on_robot_type_id"
  end

  add_foreign_key "robots", "robot_types"
  add_foreign_key "tasks", "robot_types"
  add_foreign_key "tasks", "robots"
end
