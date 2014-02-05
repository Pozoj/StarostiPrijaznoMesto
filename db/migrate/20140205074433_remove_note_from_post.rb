class RemoveNoteFromPost < ActiveRecord::Migration
  def up
    remove_column :posts, :note
  end

  def down
    add_column :posts, :note, :string
  end
end
