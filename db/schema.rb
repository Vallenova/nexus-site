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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150204033420) do

  create_table "area_diplomados", force: :cascade do |t|
    t.string   "estado"
    t.integer  "area_id"
    t.integer  "diplomado_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "area_diplomados", ["area_id", "diplomado_id"], name: "index_area_diplomados_on_area_id_and_diplomado_id", unique: true
  add_index "area_diplomados", ["area_id"], name: "index_area_diplomados_on_area_id"
  add_index "area_diplomados", ["diplomado_id"], name: "index_area_diplomados_on_diplomado_id"

  create_table "areas", force: :cascade do |t|
    t.string   "nombre"
    t.string   "estado"
    t.string   "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coleccions", force: :cascade do |t|
    t.string   "descripcion"
    t.string   "url"
    t.string   "picture"
    t.string   "estado"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "cursos", force: :cascade do |t|
    t.string   "nombre"
    t.string   "estado"
    t.integer  "modulo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "cursos", ["modulo_id"], name: "index_cursos_on_modulo_id"

  create_table "diplomados", force: :cascade do |t|
    t.string   "nombre"
    t.string   "estado"
    t.text     "descripcion"
    t.text     "objetivos"
    t.text     "dirigido"
    t.integer  "creditos"
    t.integer  "horas_acad"
    t.integer  "inversion"
    t.text     "picture"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "eventos", force: :cascade do |t|
    t.datetime "fecha_inicio"
    t.datetime "fecha_fin"
    t.string   "modalidad"
    t.integer  "inversion"
    t.string   "estado"
    t.integer  "diplomado_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "eventos", ["diplomado_id"], name: "index_eventos_on_diplomado_id"

  create_table "modulos", force: :cascade do |t|
    t.string   "nombre"
    t.string   "estado"
    t.integer  "diplomado_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "modulos", ["diplomado_id"], name: "index_modulos_on_diplomado_id"

  create_table "usuarios", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "usuarios", ["email"], name: "index_usuarios_on_email", unique: true
  add_index "usuarios", ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true

end
