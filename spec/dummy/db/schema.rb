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

ActiveRecord::Schema.define(version: 2021_08_31_164319) do

  create_table "doodads", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "works_cited_citations", force: :cascade do |t|
    t.string "citation_type"
    t.string "media"
    t.string "title"
    t.string "container_title"
    t.string "publisher"
    t.string "city"
    t.integer "edition"
    t.integer "volume"
    t.string "series"
    t.integer "year"
    t.string "pages"
    t.string "url"
    t.datetime "published_at"
    t.datetime "accessed_at"
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id"], name: "index_works_cited_citations_on_record"
  end

  create_table "works_cited_contributors", force: :cascade do |t|
    t.integer "works_cited_citation_id", null: false
    t.string "contributor_role"
    t.string "first"
    t.string "middle"
    t.string "last"
    t.string "suffix"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["works_cited_citation_id"], name: "index_works_cited_contributors_on_works_cited_citation_id"
  end

  add_foreign_key "works_cited_contributors", "works_cited_citations"
end
