class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :description
      t.integer :category
      t.string :image
      t.text :url
      t.boolean :deleted
      t.timestamps null: false
    end
  end
end
