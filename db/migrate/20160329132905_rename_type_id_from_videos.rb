class RenameTypeIdFromVideos < ActiveRecord::Migration
  def change
    rename_column :videos, :type_id, :category
  end
end
