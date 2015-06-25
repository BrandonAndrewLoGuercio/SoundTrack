class AddDefaultAvatar < ActiveRecord::Migration
  def change
    change_column :users, :avatar, :string, :default => 'music-note.png'
  end
end
