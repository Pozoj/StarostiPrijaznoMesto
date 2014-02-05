class RemoveNoteFromOriginalPost < ActiveRecord::Migration
  def up
    remove_column :original_posts, :note
  end

  def down
    add_column :original_posts, :note, :text
  end
end
