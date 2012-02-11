class City < ActiveRecord::Base
  has_and_belongs_to_many :institutions
  has_many    :original_posts
  belongs_to  :region
  
  validates_presence_of   :name
  validates_uniqueness_of :name
  
  def to_s
    name
  end
end
