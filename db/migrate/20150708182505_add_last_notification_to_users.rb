class AddLastNotificationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :last_notified, :timestamp
  end
end
