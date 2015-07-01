class DropAvatarDefault < ActiveRecord::Migration
  def change
    change_column_default(:users, :avatar, :default => nil)
  end
end
