class CreateBattlePlanes < ActiveRecord::Migration
  def change
    create_table :battle_planes do |t|
      t.string :title
      t.string :content
      t.integer :sort_id
      t.timestamps null: false
    end
  end
end
