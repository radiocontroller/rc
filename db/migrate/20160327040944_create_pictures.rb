class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.integer :type_id
      t.integer :imageable_id
      t.string :imageable_type
      t.string :resource
      t.string :description
      t.boolean :deleted
      t.timestamps null: false
    end
  end
end
