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

ActiveRecord::Schema.define(version: 20201014000812) do

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
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "argila"
    t.decimal "potassio"
    t.decimal "calcario"
    t.decimal "magnesio"
    t.decimal "enxofre20"
    t.decimal "enxofre40"
    t.decimal "hidrogenio"
    t.decimal "alcalinidade"
    t.decimal "boro"
    t.decimal "cobre"
    t.decimal "manganes"
    t.decimal "zinco"
    t.decimal "carbono"
    t.decimal "materia"
    t.decimal "valor"
    t.decimal "ctc"
    t.index ["user_id"], name: "index_amostras_on_user_id"
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
    t.string "cpf"
    t.integer "rg"
    t.string "cnpj"
    t.string "email"
    t.string "telefone"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_ownerships_on_user_id"
  end

  create_table "properties", force: :cascade do |t|
    t.string "name"
    t.bigint "ownership_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
    t.string "city"
    t.string "uf"
    t.integer "cep"
    t.integer "cep_prefix"
    t.integer "area"
    t.index ["ownership_id"], name: "index_properties_on_ownership_id"
    t.index ["user_id"], name: "index_properties_on_user_id"
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
    t.string "cpf"
    t.string "cnpj"
    t.string "phone"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "amostras", "users"
  add_foreign_key "laudos", "insumos"
  add_foreign_key "laudos", "properties"
  add_foreign_key "laudos", "users"
  add_foreign_key "ownerships", "users"
  add_foreign_key "properties", "ownerships"
  add_foreign_key "properties", "users"
end
