class RenameTypeIdFromArticles < ActiveRecord::Migration
  def change
    rename_column :articles, :type_id, :category
  end
end
