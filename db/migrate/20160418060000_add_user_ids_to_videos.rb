class AddUserIdsToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :user_ids, :json, default: []
  end
end
