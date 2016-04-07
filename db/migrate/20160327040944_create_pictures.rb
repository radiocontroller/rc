class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.integer :category
      t.string :resource
      t.string :description
      t.timestamps null: false
    end
  end
end
