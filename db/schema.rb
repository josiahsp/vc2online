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

ActiveRecord::Schema.define(version: 20181011195036) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_admins_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree
  end

  create_table "collections", force: :cascade do |t|
    t.string   "title"
    t.date     "startdate"
    t.date     "enddate"
    t.text     "description"
    t.string   "keywords"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "artwork"
    t.string   "hero_image"
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "fname"
    t.string   "lname"
    t.string   "email"
    t.string   "phone"
    t.boolean  "attendance"
    t.boolean  "growgroup"
    t.string   "growgroupleader"
    t.boolean  "dreamteam"
    t.string   "dreamteamleader"
    t.text     "details"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.boolean  "archived"
    t.integer  "archiver"
  end

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.string   "subtitle"
    t.text     "synopsis"
    t.text     "content"
    t.integer  "location_id"
    t.string   "location_building"
    t.string   "location_address"
    t.string   "location_address2"
    t.string   "location_city"
    t.string   "location_state"
    t.string   "location_zip"
    t.string   "location_googlemapsid"
    t.datetime "start"
    t.datetime "endtime"
    t.integer  "videos_id"
    t.integer  "images_id"
#   t.integer  "links_id"
    t.float    "price"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "hero_image"
    t.string   "hero_square_image"
    t.string   "cover_image"
    t.string   "thumbnail_image"
    t.string   "slug"
    t.index ["images_id"], name: "index_events_on_images_id", using: :btree
#   t.index ["links_id"], name: "index_events_on_links_id", using: :btree
    t.index ["location_id"], name: "index_events_on_location_id", using: :btree
    t.index ["videos_id"], name: "index_events_on_videos_id", using: :btree
  end

  create_table "features", force: :cascade do |t|
    t.datetime "endtime"
    t.integer  "level"
    t.integer  "event_id"
    t.integer  "page_id"
    t.integer  "classification"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.datetime "start"
    t.boolean  "live"
    t.text     "caption"
    t.index ["event_id"], name: "index_features_on_event_id", using: :btree
    t.index ["page_id"], name: "index_features_on_page_id", using: :btree
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree
  end

  create_table "images", force: :cascade do |t|
    t.string   "image"
    t.string   "title"
    t.text     "caption"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "kioskitems", force: :cascade do |t|
    t.string   "title"
    t.string   "path"
    t.string   "cover_image"
    t.datetime "starttime"
    t.datetime "endtime"
    t.boolean  "active"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "links", force: :cascade do |t|
    t.string   "title"
    t.string   "destination"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "slug"
  end

  create_table "locations", force: :cascade do |t|
    t.string   "title"
    t.string   "building"
    t.string   "address"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone"
    t.string   "leader"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "googlemapsid"
    t.string   "slug"
    t.string   "hero_image"
    t.string   "hero_square_image"
    t.string   "cover_image"
    t.string   "thumbnail_image"
  end

  create_table "meetings", force: :cascade do |t|
    t.integer  "level"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "location_id"
    t.integer  "weekday"
    t.time     "time"
    t.integer  "service_id"
    t.index ["location_id"], name: "index_meetings_on_location_id", using: :btree
  end

  create_table "menuitems", force: :cascade do |t|
    t.string   "title"
    t.string   "path"
    t.integer  "submenu_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "mainmenu"
    t.index ["submenu_id"], name: "index_menuitems_on_submenu_id", using: :btree
  end

  create_table "multicasts", force: :cascade do |t|
    t.string   "title"
    t.string   "author"
    t.text     "summary"
    t.string   "guid"
    t.datetime "pubdate"
    t.integer  "duration"
    t.string   "keywords"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "cover_image"
    t.string   "hero_image"
    t.integer  "collection_id"
    t.string   "audio"
    t.string   "video"
    t.index ["collection_id"], name: "index_multicasts_on_collection_id", using: :btree
  end

  create_table "pages", force: :cascade do |t|
    t.string   "title"
    t.string   "keywords"
    t.text     "content"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "hero_image"
    t.string   "hero_square_image"
    t.string   "cover_image"
    t.string   "thumbnail_image"
    t.string   "slug"
  end

  create_table "prayers", force: :cascade do |t|
    t.string   "title"
    t.text     "details"
    t.text     "scripture_1"
    t.text     "scripture_2"
    t.text     "scripture_3"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.boolean  "active"
  end

  create_table "quickitems", force: :cascade do |t|
    t.string   "title"
    t.string   "path"
    t.integer  "order"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "cover_image"
  end

  create_table "services", force: :cascade do |t|
    t.string   "title"
    t.integer  "priority"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "submenus", force: :cascade do |t|
    t.string   "title"
    t.boolean  "mainmenu"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "youtubes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "youversions", force: :cascade do |t|
    t.string   "series"
    t.string   "title"
    t.datetime "start"
    t.integer  "eventnumber"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_foreign_key "features", "events"
  add_foreign_key "features", "pages"
  add_foreign_key "meetings", "locations"
  add_foreign_key "multicasts", "collections"
end
