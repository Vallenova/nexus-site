class CreateModulos < ActiveRecord::Migration
  def change
    create_table :modulos do |t|
      t.string :nombre
      t.string :estado
      t.references :diplomado, index: true

      t.timestamps null: false
    end
    add_foreign_key :modulos, :diplomados
  end
end
