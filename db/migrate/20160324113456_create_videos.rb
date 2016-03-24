class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :description
      t.integer :type_id
      t.string :image
      t.text :url
      t.timestamps null: false
    end
  end
end
