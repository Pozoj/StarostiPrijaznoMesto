class AddNoteToAnswer < ActiveRecord::Migration
  def change
    add_column :answers, :note, :text
  end
end
