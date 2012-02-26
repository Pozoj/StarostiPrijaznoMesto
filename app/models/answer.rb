class Answer < ActiveRecord::Base
  validates_presence_of :answer, :summary, :answer_range, :if => lambda {|answer| ["answered", "waiting"].include?(answer.answer_status) }
  
  validates_presence_of :institution_id, :message => "Ustanova mora biti izbrana."
  validates_presence_of :answer_status
  
  before_save :set_correct_time
  before_validation :institutionalize
  after_create :change_status_of_misplaced_to_archive
  
  belongs_to :user
  belongs_to :post
  belongs_to :institution
  
  scope :answered,          where(:answer_status => "answered")
  scope :misplaced,         where(:answer_status => "misplaced")
  scope :waiting,           where(:answer_status => "waiting")
  scope :institutionalized, where(:answer_status => "institutionalized")
  

  def status
    @status ||= AnswerStatus.find(answer_status)
  end
  
  def status=(s)
    self.answer_status = AnswerStatus.find(s).id if AnswerStatus.find(s)
  end
  
  def range
    @range ||= AnswerRange.find(answer_range)
  end
  
  def range=(r)
    self.answer_range = AnswerRange.find(r).id if AnswerRange.find(r)
  end
  
  private
  
  def institutionalize
    self.answer_status = "institutionalized" if new_record?
  end
  
  def set_correct_time
    case answer_status
    when "institutionalized", :institutionalized  then self.institutionalized_at = DateTime.now
    when "misplaced", :misplaced                  then self.misplaced_at = DateTime.now
    when "waiting",   :waiting                    then self.waiting_at = DateTime.now
    when "answered",  :answered                   then self.answered_at = DateTime.now
    end
  end
  
  def change_status_of_misplaced_to_archive
    misplaced_answer = post.answers.misplaced.last
    if misplaced_answer.present?
      misplaced_answer.answer_status = "archive"
      misplaced_answer.save
    end
  end
end
