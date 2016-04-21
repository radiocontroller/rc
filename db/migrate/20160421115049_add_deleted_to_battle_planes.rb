class AddDeletedToBattlePlanes < ActiveRecord::Migration
  def change
    add_column :battle_planes, :deleted, :boolean, default: false
  end
end
