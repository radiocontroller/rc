class CreateAccessLogs < ActiveRecord::Migration
  def change
    create_table :access_logs do |t|
      t.string :ip
      t.string :location
      t.timestamps null: false
    end
  end
end
