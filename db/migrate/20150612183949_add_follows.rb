class AddFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.integer :following
      t.integer :follower

      t.timestamps
    end
  end
end
