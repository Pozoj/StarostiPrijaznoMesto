class PostOffice < ActiveRecord::Base
  has_many :institutions
  has_many :events
  
  validates_presence_of :city, :post_number
  validates_uniqueness_of :city, :post_number
  validates_numericality_of :post_number
  
  default_scope order(:city)
  
  def to_s
    "#{post_number} #{city}"
  end
end
