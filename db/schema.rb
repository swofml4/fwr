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

ActiveRecord::Schema.define(version: 20160915091948) do

  create_table "armies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "sim_armies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "army_id"
    t.integer  "sim_turn_id"
    t.integer  "starting_unit_count"
    t.string   "status"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "sim_turns", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "simulation_id"
    t.integer  "turn_count"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "sim_units", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "unit_id"
    t.string   "status"
    t.integer  "hp"
    t.integer  "pos_x"
    t.integer  "pos_y"
    t.boolean  "has_shot"
    t.boolean  "has_moved"
    t.integer  "tactic_id"
    t.integer  "tactic_utility"
    t.integer  "sim_army_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "simulation_collections", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "status"
    t.integer  "sim_count"
    t.integer  "army_points"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "simulations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "simulation_collection_id"
    t.integer  "sim_number"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "tactics", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "unit_attribute_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "rule"
    t.integer  "adjustment"
    t.integer  "negated_by_unit_attribute_type_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "unit_attribute_types_attributes", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "unit_attribute_id",      null: false
    t.integer "unit_attribute_type_id", null: false
  end

  create_table "unit_attributes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "unit_attributes_units", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "unit_id",           null: false
    t.integer "unit_attribute_id", null: false
  end

  create_table "unit_tactics", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "unit_id"
    t.integer  "tactic_id"
    t.integer  "base_bias"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "unit_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "units", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "army_id"
    t.integer  "quality"
    t.integer  "resilience"
    t.integer  "strength"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "unit_type_id"
    t.integer  "hp"
    t.integer  "cost"
    t.decimal  "sim_cost",     precision: 10
    t.integer  "sim_shift"
  end

end
