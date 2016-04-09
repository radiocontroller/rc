class AddIsHomepageToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :is_homepage, :boolean, default: false
  end
end
