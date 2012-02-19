class ChangeTagsAssociationToPostsAndDestroyTagGroupsAndPostsTags < ActiveRecord::Migration
  def up
    drop_table :posts_tags
    drop_table :tag_groups
    remove_column :tags, :tag_group_id
    add_column :posts, :tag_id, :integer
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
