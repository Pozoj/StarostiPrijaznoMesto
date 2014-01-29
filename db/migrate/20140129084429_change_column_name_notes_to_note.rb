class ChangeColumnNameNotesToNote < ActiveRecord::Migration
  def up
    rename_column :answer, :notes, :note
  end

  def down
    rename_column :answer, :note, :notes
  end
end
