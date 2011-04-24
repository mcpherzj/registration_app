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

ActiveRecord::Schema.define(:version => 20110423234643) do

  create_table "event_disciplines", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "event_disciplines", ["name"], :name => "index_event_disciplines_on_name", :unique => true

  create_table "event_selections", :force => true do |t|
    t.integer  "registration_id"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "selected"
  end

  create_table "event_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "event_types", ["name"], :name => "index_event_types_on_name", :unique => true

  create_table "events", :force => true do |t|
    t.string   "name"
    t.integer  "event_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active"
    t.integer  "gender_id"
  end

  add_index "events", ["name", "gender_id"], :name => "index_events_on_name_and_gender_id", :unique => true

  create_table "genders", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "genders", ["name"], :name => "index_genders_on_name", :unique => true

  create_table "participants", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "street_address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "subdivision"
    t.string   "school"
    t.string   "grade"
    t.date     "date_of_birth"
    t.string   "home_phone"
    t.string   "cell_phone"
    t.string   "email"
    t.string   "preferred_parent_email"
    t.string   "fathers_name"
    t.string   "fathers_work_phone"
    t.string   "fathers_cell_phone"
    t.string   "fathers_email"
    t.string   "mothers_name"
    t.string   "mothers_work_phone"
    t.string   "mothers_cell_phone"
    t.string   "mothers_email"
    t.string   "nearest_relative_name"
    t.string   "nearest_relative_phone"
    t.text     "special_precautions"
    t.string   "emergency_contact_name"
    t.string   "emergency_contact_phone"
    t.text     "medication_in_athletes_possession"
    t.text     "pertinent_medical_history"
    t.string   "medical_insurance_company"
    t.string   "name_of_insured"
    t.string   "policy_or_group_number"
    t.string   "medical_insurance_id_number"
    t.integer  "gender_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "registrations", :force => true do |t|
    t.integer  "participant_id"
    t.integer  "season_id"
    t.integer  "uniform_size_id"
    t.integer  "shirt_size_id"
    t.integer  "event_discipline_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "season_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "seasons", :force => true do |t|
    t.integer  "year"
    t.boolean  "active"
    t.integer  "season_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shirt_sizes", :force => true do |t|
    t.string   "name"
    t.integer  "sort_order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "uniform_sizes", :force => true do |t|
    t.string   "name"
    t.integer  "sort_order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "volunteer_interests", :force => true do |t|
    t.string   "name"
    t.integer  "sort_order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "volunteer_selections", :force => true do |t|
    t.integer  "registration_id"
    t.integer  "volunter_interest_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "selected"
  end

end
