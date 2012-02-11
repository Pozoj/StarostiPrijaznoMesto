class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer  :holder_id
      t.string   :holder_type
      t.string   :photo_file_name
      t.string   :photo_content_type
      t.string   :photo_file_size
      t.string   :photo_updated_at
      t.timestamps
    end
  end
end
