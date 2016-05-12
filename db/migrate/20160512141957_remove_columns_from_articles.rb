class RemoveColumnsFromArticles < ActiveRecord::Migration
  def change
    remove_column :articles, :is_homepage, :boolean
    remove_column :articles, :images, :json
  end
end
