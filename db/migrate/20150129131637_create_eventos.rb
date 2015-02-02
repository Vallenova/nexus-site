class CreateEventos < ActiveRecord::Migration
  def change
    create_table :eventos do |t|
      t.datetime :fecha_inicio
      t.datetime :fecha_fin
      t.string :modalidad
      t.integer :inversion
      t.string :estado
      t.references :diplomado, index: true

      t.timestamps null: false
    end
    add_foreign_key :eventos, :diplomados
  end
end
