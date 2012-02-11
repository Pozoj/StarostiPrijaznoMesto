class Institution < ActiveRecord::Base
  belongs_to :post_office
  has_many :users
  has_many :events
  has_many :answers
  has_and_belongs_to_many :cities
  
  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :address
  
  
  def to_s
    name
  end
end
