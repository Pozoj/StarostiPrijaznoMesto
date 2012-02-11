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

ActiveRecord::Schema.define(:version => 20120210122638) do

  create_table "abouts", :force => true do |t|
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "access_rights", :force => true do |t|
    t.string   "user_kind_id"
    t.string   "name"
    t.string   "right"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "answers", :force => true do |t|
    t.text     "answer"
    t.text     "suggestion"
    t.string   "answer_status"
    t.integer  "user_id"
    t.integer  "institution_id"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "summary"
    t.string   "range"
    t.text     "notes"
  end

  create_table "cities", :force => true do |t|
    t.string   "name"
    t.integer  "region_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cities_institutions", :id => false, :force => true do |t|
    t.integer "city_id"
    t.integer "institution_id"
  end

  create_table "conditions", :force => true do |t|
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "tax_nr"
    t.string   "telephone"
    t.string   "fax"
    t.string   "mobile"
    t.string   "email"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", :force => true do |t|
    t.integer  "institution_id"
    t.integer  "user_id"
    t.integer  "post_office_id"
    t.string   "title"
    t.datetime "date_and_time_at"
    t.text     "description"
    t.string   "address"
    t.float    "lat"
    t.float    "lng"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "region_wide"
  end

  create_table "institutions", :force => true do |t|
    t.string   "name"
    t.string   "short_name"
    t.text     "description"
    t.string   "address"
    t.integer  "post_office_id"
    t.float    "lat"
    t.float    "lng"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "phone"
    t.string   "fax"
    t.string   "website"
    t.text     "tasks"
  end

  create_table "original_posts", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "ip"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "city_id"
  end

  create_table "photos", :force => true do |t|
    t.integer  "holder_id"
    t.string   "holder_type"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.string   "photo_file_size"
    t.string   "photo_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "post_offices", :force => true do |t|
    t.integer "post_number"
    t.string  "city"
  end

  create_table "posts", :force => true do |t|
    t.integer  "original_post_id"
    t.integer  "info_admin_id"
    t.string   "post_kind_id"
    t.string   "title"
    t.text     "summary"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "post_status_id"
    t.string   "sex_id"
  end

  create_table "posts_tags", :id => false, :force => true do |t|
    t.integer "post_id"
    t.integer "tag_id"
  end

  create_table "project_infos", :force => true do |t|
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "red_buttons", :force => true do |t|
    t.string   "title"
    t.text     "short_description"
    t.text     "description"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "regions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tag_groups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", :force => true do |t|
    t.text     "tag"
    t.integer  "tag_group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "user_kind_id"
    t.integer  "institution_id"
    t.boolean  "admin",                                 :default => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.string   "email",                                 :default => "",    :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "",    :null => false
    t.string   "password_salt"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "notes"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
