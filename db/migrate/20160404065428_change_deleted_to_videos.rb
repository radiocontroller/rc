class ChangeDeletedToVideos < ActiveRecord::Migration
  def change
    change_column :videos, :deleted, :boolean, default: false
  end
end
