class CreateAreas < ActiveRecord::Migration
  def change
    create_table :areas do |t|
      t.string :nombre
      t.string :estado
      t.string :picture

      t.timestamps null: false
    end
  end
end
