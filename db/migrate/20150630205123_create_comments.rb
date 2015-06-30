class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.column :user_id, :integer
      t.column :post_id, :integer
      t.column :comment, :string
    end
  end
end
