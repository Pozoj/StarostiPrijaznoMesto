class Region < ActiveRecord::Base
  has_many :cities
  
  validates_presence_of   :name
  validates_uniqueness_of :name
  
  def to_s
    name
  end
end
