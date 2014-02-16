class Institution < ActiveRecord::Base
  belongs_to :post_office
  has_many :users
  has_many :events
  has_many :answers
  has_many :work_hours
  has_many :attachments, :as => :holder, :dependent => :destroy
  has_many :contacts
  
  has_and_belongs_to_many :cities
  
  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :address

  scope :visible,    where(:visible => "visible")
  scope :invisible,  where(:visible => "invisible")

  def work_time
    work_hours.last
  end
  
  def photos_added?
    @attachemts_added ||= attachments.any?
  end
  
  def photo    
    attachments.last if photos_added?
  end
  
  def photos_url(size)
    photo.attachment.url(size) if photos_added?
  end
  
  def to_s
    name
  end
end
