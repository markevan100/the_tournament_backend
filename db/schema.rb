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

ActiveRecord::Schema.define(version: 2019_08_11_035227) do

  create_table "games", force: :cascade do |t|
    t.integer "team1"
    t.integer "team2"
    t.integer "team1_points"
    t.integer "team2_points"
  end

  create_table "matches", force: :cascade do |t|
    t.integer "team1"
    t.integer "team2"
    t.integer "team1_wins"
    t.integer "team2_wins"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.integer "matches_played"
    t.integer "matches_won"
    t.integer "matches_lost"
    t.integer "games_diff"
    t.integer "point_diff"
  end

end
