class AddVideoIdsAndArticleIdsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :video_ids, :json, default: []
    add_column :users, :article_ids, :json, default: []
  end
end
