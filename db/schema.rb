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

ActiveRecord::Schema.define(version: 20210224220613) do

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
    t.string "property_name"
    t.integer "profundidade"
    t.integer "compactacao"
    t.integer "peso"
    t.bigint "user_id"
    t.bigint "property_id"
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
    t.index ["property_id"], name: "index_amostras_on_property_id"
    t.index ["user_id"], name: "index_amostras_on_user_id"
  end

  create_table "analise_amostras", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "analise_id"
    t.jsonb "amostras", default: {}, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["analise_id"], name: "index_analise_amostras_on_analise_id"
    t.index ["user_id"], name: "index_analise_amostras_on_user_id"
  end

  create_table "analises", force: :cascade do |t|
    t.string "solicitante"
    t.bigint "user_id"
    t.bigint "property_id"
    t.bigint "ownership_id"
    t.bigint "insumo_id"
    t.string "owner_name", default: ""
    t.string "property_name", default: ""
    t.string "insumo_name", default: ""
    t.jsonb "coordinates", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["insumo_id"], name: "index_analises_on_insumo_id"
    t.index ["ownership_id"], name: "index_analises_on_ownership_id"
    t.index ["property_id"], name: "index_analises_on_property_id"
    t.index ["user_id"], name: "index_analises_on_user_id"
  end

  create_table "insumos", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "laudos", force: :cascade do |t|
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
    t.bigint "user_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
    t.decimal "lng", precision: 10, scale: 6
    t.decimal "lat", precision: 10, scale: 6
    t.string "city"
    t.string "uf"
    t.integer "cep"
    t.integer "cep_prefix"
    t.integer "total_area"
    t.integer "field_area"
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
    t.boolean "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "amostras", "properties"
  add_foreign_key "amostras", "users"
  add_foreign_key "analise_amostras", "analises"
  add_foreign_key "analise_amostras", "users"
  add_foreign_key "analises", "insumos"
  add_foreign_key "analises", "ownerships"
  add_foreign_key "analises", "properties"
  add_foreign_key "analises", "users"
  add_foreign_key "ownerships", "users"
  add_foreign_key "properties", "users"
end
