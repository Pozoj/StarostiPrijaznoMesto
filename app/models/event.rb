class Event < ActiveRecord::Base
  belongs_to :institution
  belongs_to :user
  belongs_to :post_office
  
  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :date_and_time_at
  validates_presence_of :address
  
  scope :this_month,  where(:date_and_time_at => Date.today.beginning_of_month..Date.today.end_of_month)
  scope :on_month,    lambda { |date| where("YEAR(date_and_time_at) = ?", date.year).where("MONTH(date_and_time_at) = ?", date.month) }
  scope :on_day,      lambda { |date| where("YEAR(date_and_time_at) = ?", date.year).where("MONTH(date_and_time_at) = ?", date.month).where("DAY(date_and_time_at) = ?", date.day).order("date_and_time_at ASC") }
  
  class << self
    def this_months_event_days
      self.this_month.group_by {|e| e.date_and_time_at.to_date.day }
    end
  end
  
  def day
    date_and_time_at.day
  end
  
  def to_s
    title
  end
end
