class Tag < ActiveRecord::Base
  belongs_to :tag_group
  has_and_belongs_to_many :posts
  
  validates_presence_of :tag
end
