class AddNoteToOriginalPost < ActiveRecord::Migration
  def change
    add_column :original_posts, :note, :string
  end
end
