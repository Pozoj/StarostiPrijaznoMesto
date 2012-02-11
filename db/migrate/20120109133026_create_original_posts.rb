class CreateOriginalPosts < ActiveRecord::Migration
  def change
    create_table :original_posts do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :ip
      t.text :text

      t.timestamps
    end
  end
end
