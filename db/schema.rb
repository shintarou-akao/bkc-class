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

ActiveRecord::Schema.define(version: 20181001041303) do

  create_table "departments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "grades", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lessons", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "lesson_id"
    t.integer  "teacher_id"
    t.string   "lesson_evaluation"
    t.string   "lesson_level"
    t.string   "text_necessity"
    t.string   "attendance"
    t.text     "additional_explanation", limit: 65535
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.index ["lesson_id"], name: "index_posts_on_lesson_id", using: :btree
    t.index ["teacher_id"], name: "index_posts_on_teacher_id", using: :btree
    t.index ["user_id"], name: "index_posts_on_user_id", using: :btree
  end

  create_table "subjects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teachers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nickname"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "grade_id"
    t.integer  "department_id"
    t.integer  "subject_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["department_id"], name: "index_users_on_department_id", using: :btree
    t.index ["grade_id"], name: "index_users_on_grade_id", using: :btree
    t.index ["subject_id"], name: "index_users_on_subject_id", using: :btree
  end

  add_foreign_key "posts", "lessons"
  add_foreign_key "posts", "teachers"
  add_foreign_key "posts", "users"
  add_foreign_key "users", "departments"
  add_foreign_key "users", "grades"
  add_foreign_key "users", "subjects"
end
