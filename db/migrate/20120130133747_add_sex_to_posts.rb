class AddSexToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :sex_id, :string
  end
end
