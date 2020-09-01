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

ActiveRecord::Schema.define(version: 20200901182433) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "adubos", force: :cascade do |t|
    t.string "comercial_name"
    t.integer "n"
    t.integer "p"
    t.integer "k"
    t.decimal "preco_saca"
    t.string "description"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "amostras", force: :cascade do |t|
    t.string "owner_name"
    t.integer "cpf"
    t.string "telefone"
    t.string "property_name"
    t.integer "profundidade"
    t.integer "compactacao"
    t.integer "peso"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "insumos", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "laudos", force: :cascade do |t|
    t.string "solicitante"
    t.bigint "user_id"
    t.bigint "property_id"
    t.string "proprietario"
    t.bigint "insumo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["insumo_id"], name: "index_laudos_on_insumo_id"
    t.index ["property_id"], name: "index_laudos_on_property_id"
    t.index ["user_id"], name: "index_laudos_on_user_id"
  end

  create_table "ownerships", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "last_name"
  end

  create_table "properties", force: :cascade do |t|
    t.string "name"
    t.bigint "ownership_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "city"
    t.string "uf"
    t.index ["ownership_id"], name: "index_properties_on_ownership_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "last_name"
    t.integer "crea_number"
    t.bigint "laudo_id"
    t.bigint "users_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["laudo_id"], name: "index_users_on_laudo_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["users_id"], name: "index_users_on_users_id"
  end

  add_foreign_key "laudos", "insumos"
  add_foreign_key "laudos", "properties"
  add_foreign_key "laudos", "users"
  add_foreign_key "properties", "ownerships"
  add_foreign_key "users", "laudos"
  add_foreign_key "users", "users", column: "users_id"
end
