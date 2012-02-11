class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :original_post_id
      t.integer :info_admin_id
      t.string :post_kind_id
      t.string :title
      t.text :summary
      t.text :text

      t.timestamps
    end
  end
end
