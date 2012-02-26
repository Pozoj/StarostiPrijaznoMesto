class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.integer  :holder_id
      t.string   :holder_type
      t.string   :attachment_file_name
      t.string   :attachment_content_type
      t.string   :attachment_file_size
      t.string   :attachment_updated_at
    end
  end
end
