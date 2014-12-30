class CreateDiplomados < ActiveRecord::Migration
  def change
    create_table :diplomados do |t|
      t.string :nombre
      t.string :estado
      t.text :descripcion
      t.text :objetivos
      t.text :dirigido
      t.integer :creditos
      t.integer :horas_acad
      t.integer :inversion
      t.text :picture

      t.timestamps null: false
    end
  end
end
