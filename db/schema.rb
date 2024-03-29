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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130409234015) do

  create_table "frames", :force => true do |t|
    t.integer "game_id"
    t.integer "number"
  end

  create_table "games", :force => true do |t|
    t.integer "match_id"
    t.string  "player"
    t.integer "next_game_id"
  end

  create_table "matches", :force => true do |t|
    t.datetime "started_at", :null => false
    t.datetime "ended_at"
  end

  create_table "rolls", :force => true do |t|
    t.integer  "frame_id"
    t.integer  "pins"
    t.integer  "number"
    t.boolean  "is_foul",    :default => false
    t.boolean  "is_split",   :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

end
