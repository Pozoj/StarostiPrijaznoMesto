class AddApprovedAttachmentToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :approved_attachment, :boolean, :default => false
  end
end
