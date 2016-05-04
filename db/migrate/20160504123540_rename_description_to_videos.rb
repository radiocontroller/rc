class RenameDescriptionToVideos < ActiveRecord::Migration
  def change
    rename_column :videos, :description, :title
  end
end
