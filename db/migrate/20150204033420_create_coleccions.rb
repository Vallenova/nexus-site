class CreateColeccions < ActiveRecord::Migration
  def change
    create_table :coleccions do |t|
      t.string :descripcion
      t.string :url
      t.string :picture
      t.string :estado

      t.timestamps null: false
    end
  end
end
