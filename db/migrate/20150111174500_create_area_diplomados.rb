class CreateAreaDiplomados < ActiveRecord::Migration
  def change
    create_table :area_diplomados do |t|
      t.string :estado
      t.references :area, index: true
      t.references :diplomado, index: true

      t.timestamps null: false
    end
    add_foreign_key :area_diplomados, :areas
    add_foreign_key :area_diplomados, :diplomados
    add_index :area_diplomados, [:area_id, :diplomado_id], unique: true
  end
end
