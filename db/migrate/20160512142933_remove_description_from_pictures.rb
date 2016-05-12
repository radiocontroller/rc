class RemoveDescriptionFromPictures < ActiveRecord::Migration
  def change
    remove_column :pictures, :description, :string
  end
end
