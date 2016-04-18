class AddUserIdsToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :user_ids, :json, default: []
  end
end
