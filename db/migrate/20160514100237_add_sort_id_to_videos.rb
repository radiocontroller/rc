class AddSortIdToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :sort_id, :integer
  end
end
