class CreateHeadlines < ActiveRecord::Migration
  def change
    create_table :headlines do |t|
      t.column :user_id, :integer
      t.column :headlines, :string
      t.timestamps null: false
    end
  end
end
