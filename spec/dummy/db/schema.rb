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

ActiveRecord::Schema.define(:version => 20130831151403) do

  create_table "blocks", :force => true do |t|
    t.string   "name",                       :null => false
    t.string   "title",      :default => "", :null => false
    t.text     "body",       :default => "", :null => false
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "blocks", ["name"], :name => "index_blocks_on_name", :unique => true

  create_table "pages", :force => true do |t|
    t.string   "slug",                             :null => false
    t.string   "title",            :default => "", :null => false
    t.text     "body",             :default => "", :null => false
    t.string   "ancestry"
    t.integer  "order",                            :null => false
    t.string   "meta_description", :default => "", :null => false
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  add_index "pages", ["ancestry"], :name => "index_pages_on_ancestry"
  add_index "pages", ["order"], :name => "index_pages_on_order"
  add_index "pages", ["slug"], :name => "index_pages_on_slug"

  create_table "posts", :force => true do |t|
    t.date     "date",                       :null => false
    t.string   "title",      :default => "", :null => false
    t.text     "body",       :default => "", :null => false
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "posts", ["date"], :name => "index_posts_on_date"

end
