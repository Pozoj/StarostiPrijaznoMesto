class AddCityIdToOriginalPosts < ActiveRecord::Migration
  def change
    add_column :original_posts, :city_id, :integer
  end
end
