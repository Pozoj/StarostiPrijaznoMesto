class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.text :tag
      t.integer :tag_group_id
      t.timestamps
    end
  end
end
