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

ActiveRecord::Schema[7.0].define(version: 2023_05_07_181643) do
  create_table "course_types", force: :cascade do |t|
    t.string "name"
    t.integer "school_id", null: false
    t.index ["school_id"], name: "index_course_types_on_school_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.integer "course_type_id", null: false
    t.integer "school_id", null: false
    t.integer "edition_id", null: false
    t.index ["course_type_id"], name: "index_courses_on_course_type_id"
    t.index ["edition_id"], name: "index_courses_on_edition_id"
    t.index ["school_id"], name: "index_courses_on_school_id"
  end

  create_table "editions", force: :cascade do |t|
    t.date "date"
    t.integer "course_id"
    t.index ["course_id"], name: "index_editions_on_course_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
  end

  add_foreign_key "course_types", "schools"
  add_foreign_key "courses", "course_types"
  add_foreign_key "courses", "editions"
  add_foreign_key "courses", "schools"
end
