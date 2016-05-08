class AddFreeAtToUsers < ActiveRecord::Migration
  def change
    add_column :users, :free_at, :datetime, default: Time.now
  end
end
