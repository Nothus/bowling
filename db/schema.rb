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

  create_table "games", :force => true do |t|
    t.integer "match_id"
    t.string  "player"
    t.integer "next_game_id"
    t.integer "frame1_1"
    t.integer "frame1_2"
    t.integer "frame2_1"
    t.integer "frame2_2"
    t.integer "frame3_1"
    t.integer "frame3_2"
    t.integer "frame4_1"
    t.integer "frame4_2"
    t.integer "frame5_1"
    t.integer "frame5_2"
    t.integer "frame6_1"
    t.integer "frame6_2"
    t.integer "frame7_1"
    t.integer "frame7_2"
    t.integer "frame8_1"
    t.integer "frame8_2"
    t.integer "frame9_1"
    t.integer "frame9_2"
    t.integer "frame10_1"
    t.integer "frame10_2"
    t.integer "frame10_3"
  end

  create_table "matches", :force => true do |t|
    t.datetime "started_at", :null => false
    t.datetime "ended_at"
  end

end
