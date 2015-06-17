class AddMessageToPosts < ActiveRecord::Migration
  def change
    change_table :posts do |t|
      t.text :message
    end
  end
end
