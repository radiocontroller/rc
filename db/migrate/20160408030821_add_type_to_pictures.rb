class AddTypeToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :type, :string
  end
end
