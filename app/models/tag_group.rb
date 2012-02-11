class TagGroup < ActiveRecord::Base
  has_many :tags
  validates_presence_of :name
end
