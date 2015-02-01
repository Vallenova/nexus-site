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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20141228163445) do
=======
ActiveRecord::Schema.define(version: 20150111174500) do

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
>>>>>>> 5e1506d57475e4f04e559bb44c57d747eede2db3

  create_table "areas", force: :cascade do |t|
    t.string   "nombre"
    t.string   "estado"
    t.string   "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

<<<<<<< HEAD
  create_table "usuarios", force: :cascade do |t|
    t.string   "email"
    t.string   "nombres"
    t.string   "apellidos"
=======
  create_table "cursos", force: :cascade do |t|
    t.string   "nombre"
    t.string   "estado"
    t.integer  "modulo_id"
>>>>>>> 5e1506d57475e4f04e559bb44c57d747eede2db3
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

<<<<<<< HEAD
=======
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

  create_table "modulos", force: :cascade do |t|
    t.string   "nombre"
    t.string   "estado"
    t.integer  "diplomado_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "modulos", ["diplomado_id"], name: "index_modulos_on_diplomado_id"

>>>>>>> 5e1506d57475e4f04e559bb44c57d747eede2db3
end
