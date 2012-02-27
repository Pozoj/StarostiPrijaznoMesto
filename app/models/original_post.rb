class OriginalPost < ActiveRecord::Base
  has_many :posts
  has_many :attachments, :as => :holder, :dependent => :destroy  
  
  validates_presence_of :first_name, :last_name, :text
  accepts_nested_attributes_for :attachments
  
  class << self
    
    # Displays all user entered posts that had not yet been treated
    #
    def untreated
      joins("LEFT JOIN posts ON original_posts.id = posts.original_post_id").where("posts.id IS NULL") #.order("created_at DESC").group_by {|og_post| og_post.created_at.to_date }
    end
  end # class << self

  def to_s
    text
  end
  
  def attachment
    attachments.last
  end
  
  def attachment_added?
    attachments.present?
  end
  
  def attachment_name
    attachment.attachment_file_name
  end
  
  def sender
    "#{first_name} #{last_name}"
  end
  
end
