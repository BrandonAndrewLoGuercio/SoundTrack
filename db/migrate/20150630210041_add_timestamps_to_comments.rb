class AddTimestampsToComments < ActiveRecord::Migration
  def change
    add_column :comments, :created_at, :datetime
  end
end
