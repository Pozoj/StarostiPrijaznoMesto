class Answer < ActiveRecord::Base
  validates_presence_of :answer_status
  
  belongs_to :user
  belongs_to :post
  belongs_to :institution
  
  scope :answered,          where(:answer_status => "answered")
  scope :misplaced,         where(:answer_status => "misplaced")  
  scope :institutionalized, where(:answer_status => "institutionalized")
  
  
end
