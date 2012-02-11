class RedButton < ActiveRecord::Base
  validates_presence_of :title, :short_description, :description, :url
end
