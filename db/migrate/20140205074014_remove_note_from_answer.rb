class RemoveNoteFromAnswer < ActiveRecord::Migration
  def up
    remove_column :answers, :note
  end

  def down
    add_column :answers, :note, :text
  end
end
