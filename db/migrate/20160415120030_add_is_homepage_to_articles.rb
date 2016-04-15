class AddIsHomepageToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :is_homepage, :boolean, default: false
  end
end
