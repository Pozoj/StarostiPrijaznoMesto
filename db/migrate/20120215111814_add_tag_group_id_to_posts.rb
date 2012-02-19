class AddTagGroupIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :tag_group_id, :string
  end
end
