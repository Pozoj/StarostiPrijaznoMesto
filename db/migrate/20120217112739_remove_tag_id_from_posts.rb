class RemoveTagIdFromPosts < ActiveRecord::Migration
  def up
    remove_column :posts, :tag_id
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
