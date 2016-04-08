class AddSortIdToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :sort_id, :integer
  end
end
