class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.integer :type_id
      t.string :description
      t.string :image
      t.text :url
      t.boolean :deleted
      t.timestamps null: false
    end
  end
end
