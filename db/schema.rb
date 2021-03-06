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

ActiveRecord::Schema.define(:version => 20140211075624) do

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

  create_table "addressed_posts_v", :id => false, :force => true do |t|
    t.integer  "original_posts_id",         :default => 0, :null => false
    t.datetime "original_posts_created_at"
    t.string   "original_posts_first_name"
    t.string   "original_posts_last_name"
    t.integer  "posts_id",                  :default => 0
    t.datetime "posts_created_at"
    t.string   "posts_tag_group_id"
    t.string   "posts_title"
    t.string   "posts_post_kind_id"
    t.string   "institutions_name"
    t.integer  "institutions_id",           :default => 0
    t.integer  "answers_id",                :default => 0
    t.string   "answers_answer_status"
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
    t.string   "answer_range"
    t.datetime "institutionalized_at"
    t.datetime "answered_at"
    t.datetime "misplaced_at"
    t.datetime "waiting_at"
    t.text     "note"
  end

  create_table "attachments", :force => true do |t|
    t.integer "holder_id"
    t.string  "holder_type"
    t.string  "attachment_file_name"
    t.string  "attachment_content_type"
    t.string  "attachment_file_size"
    t.string  "attachment_updated_at"
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
    t.integer  "institution_id"
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

  create_table "homescreen_posts_v", :id => false, :force => true do |t|
    t.date    "original_posts_created_at"
    t.string  "senders_name",              :limit => 511
    t.integer "posts_id",                                 :default => 0
    t.text    "posts_summary"
    t.string  "senders_sex"
    t.string  "post_kind_id"
    t.integer "institutions_id",                          :default => 0
    t.string  "institutions_name"
    t.text    "answers_summary"
    t.date    "answers_date"
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
    t.string   "visible"
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
    t.string   "tag_group_id"
    t.boolean  "approved_attachment", :default => false
    t.text     "note"
  end

  create_table "project_infos", :force => true do |t|
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "public_posts_v", :id => false, :force => true do |t|
    t.date    "original_posts_created_at"
    t.string  "senders_name",              :limit => 511
    t.integer "posts_id",                                 :default => 0
    t.string  "posts_title"
    t.string  "post_kind_id"
    t.string  "posts_tag_group_id"
    t.string  "institutions_name"
    t.integer "institutions_id",                          :default => 0
    t.string  "answers_answer_status"
    t.date    "answers_date"
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

  create_table "rejected_posts_v", :id => false, :force => true do |t|
    t.date    "original_posts_created_at"
    t.string  "original_posts_first_name"
    t.string  "original_posts_last_name"
    t.string  "original_posts_email"
    t.integer "posts_id",                  :default => 0
  end

  create_table "statistics_table_v", :id => false, :force => true do |t|
    t.integer  "original_posts_id",            :default => 0, :null => false
    t.datetime "original_posts_created_at"
    t.string   "original_posts_first_name"
    t.string   "original_posts_last_name"
    t.integer  "posts_id",                     :default => 0, :null => false
    t.datetime "posts_created_at"
    t.string   "posts_post_status_id"
    t.string   "posts_post_kind_id"
    t.string   "posts_title"
    t.string   "posts_tag_group_id"
    t.string   "posts_sex_id"
    t.integer  "institutions_id",              :default => 0
    t.string   "institutions_name"
    t.integer  "responders_id",                :default => 0
    t.string   "responders_first_name"
    t.string   "responders_last_name"
    t.integer  "info_admins_id",               :default => 0
    t.string   "info_admins_first_name"
    t.string   "info_admins_last_name"
    t.integer  "answers_id",                   :default => 0
    t.string   "answers_answer_status"
    t.datetime "answers_institutionalized_at"
    t.datetime "answers_misplaced_at"
    t.datetime "answers_answered_at"
  end

  create_table "super_admin_table_v", :id => false, :force => true do |t|
    t.integer  "original_posts_id",            :default => 0, :null => false
    t.datetime "original_posts_created_at"
    t.string   "original_posts_first_name"
    t.string   "original_posts_last_name"
    t.integer  "posts_id",                     :default => 0
    t.datetime "posts_created_at"
    t.string   "posts_post_status_id"
    t.string   "posts_post_kind_id"
    t.string   "posts_title"
    t.string   "posts_tag_group_id"
    t.integer  "institutions_id",              :default => 0
    t.string   "institutions_name"
    t.integer  "responders_id",                :default => 0
    t.string   "responders_first_name"
    t.string   "responders_last_name"
    t.integer  "info_admins_id",               :default => 0
    t.string   "info_admins_first_name"
    t.string   "info_admins_last_name"
    t.integer  "answers_id",                   :default => 0
    t.string   "answers_answer_status"
    t.datetime "answers_institutionalized_at"
    t.datetime "answers_misplaced_at"
    t.datetime "answers_answered_at"
  end

  create_table "tags", :force => true do |t|
    t.text     "tag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "unaddressed_posts_v", :id => false, :force => true do |t|
    t.integer  "original_posts_id",         :default => 0, :null => false
    t.datetime "original_posts_created_at"
    t.string   "original_posts_first_name"
    t.string   "original_posts_last_name"
    t.integer  "posts_id",                  :default => 0
    t.datetime "posts_created_at"
    t.string   "posts_tag_group_id"
    t.string   "posts_title"
    t.string   "posts_post_kind_id"
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "user_kind_id"
    t.integer  "institution_id"
    t.boolean  "admin",                                 :default => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.string   "email",                                                    :null => false
    t.string   "encrypted_password",     :limit => 128,                    :null => false
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
    t.string   "authentication_token"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

  create_table "work_hours", :force => true do |t|
    t.integer  "institution_id"
    t.string   "mon_from"
    t.string   "mon_to"
    t.string   "tue_from"
    t.string   "tue_to"
    t.string   "wed_from"
    t.string   "wed_to"
    t.string   "thu_from"
    t.string   "thu_to"
    t.string   "fri_from"
    t.string   "fri_to"
    t.string   "sat_from"
    t.string   "sat_to"
    t.string   "sun_from"
    t.string   "sun_to"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
