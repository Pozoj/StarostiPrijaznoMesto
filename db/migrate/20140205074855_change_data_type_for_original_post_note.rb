class ChangeDataTypeForOriginalPostNote < ActiveRecord::Migration
  def up
    change_column :original_posts, :note, :text
  end

  def down
    change_column :original_posts, :note, :string
  end
end
