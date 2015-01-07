class CreateCursos < ActiveRecord::Migration
  def change
    create_table :cursos do |t|
      t.string :nombre
      t.string :estado
      t.references :modulo, index: true

      t.timestamps null: false
    end
    add_foreign_key :cursos, :modulos
  end
end
