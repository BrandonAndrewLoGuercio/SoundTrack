class ChangeFollowsToRelationships < ActiveRecord::Migration
  def change
    rename_table :follows, :relationships
  end
end
