class Attachment < ActiveRecord::Base
  belongs_to :holder, :polymorphic => true
  before_save :filename_to_permalink
  
  has_attached_file :attachment, 
                    :styles => { :small => "150x150>", :medium => "250x250>", :big => "425x320#"},
                    :url  => "/system/attachments/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/system/attachments/:id/:style/:basename.:extension"
  
  before_post_process :is_image?
  validates_attachment_presence :attachment
  validates_attachment_size :attachment, :less_than => 5.megabytes, :if => Proc.new { |attachment| not attachment.attachment.nil? }
  validates_attachment_content_type :attachment, :content_type => ['application/pdf', 'application/msexcel', 'application/excel', 'application/x-msexcel', 'application/x-excel', 'application/vnd.ms-excel', 'application/msword', 'image/jpeg', 'image/png'], :if => Proc.new { |attachment| not attachment.attachment.nil? }
  
  private
  
  def filename_to_permalink
    extension = File.extname(attachment_file_name).downcase
    file_name = attachment_file_name.sub extension, ''
    self.attachment.instance_write(:file_name, file_name.to_permalink + extension)
  end
  
  def is_image?
    !(attachment_content_type =~ /^image/).nil?
  end
  
end
