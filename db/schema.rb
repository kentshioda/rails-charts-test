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

ActiveRecord::Schema.define(version: 20180821114349) do

  create_table "real_estates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "place", null: false
    t.integer "price", null: false
    t.string "year", null: false
    t.integer "square_meter", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "record_numbers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "count", null: false
    t.string "date", null: false
    t.string "company", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
