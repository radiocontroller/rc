class AddDeletedToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :deleted, :boolean, default: false
  end
end
