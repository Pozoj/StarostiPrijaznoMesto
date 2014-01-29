class ChangeColumnNameNotesToNote < ActiveRecord::Migration
  def up
    rename_column :answers, :notes, :note
  end

  def down
    rename_column :answers, :note, :notes
  end
end
