class OriginalPost < ActiveRecord::Base
  has_many :posts
  has_many :photos, :as => :holder, :dependent => :destroy  
  
  validates_presence_of :first_name, :last_name, :text
  accepts_nested_attributes_for :photos
  
  class << self
    
    # Displays all user entered posts that had not yet been treated
    #
    def untreated
      joins("LEFT JOIN posts ON original_posts.id = posts.original_post_id").where("posts.id IS NULL").order("created_at DESC").group_by {|og_post| og_post.created_at.to_date }
      #all - self.find(Recipe.original_ids)
    end
  end # class << self

  def to_s
    text
  end
  
  def sender
    "#{first_name} #{last_name}"
  end
  
end
