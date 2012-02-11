class AddPostStatusIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :post_status_id, :string
  end
end
