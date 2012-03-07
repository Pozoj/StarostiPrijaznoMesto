class Answer < ActiveRecord::Base
  before_save :set_correct_time
  before_validation :institutionalize_or_clear_answer_status
  after_create :change_status_of_misplaced_to_archive
  
  validates_presence_of :user_id, :answer, :summary, :answer_range, :if => lambda {|ans| ans.answer_status == "answered" or ans.answer_status == "waiting" }
  validates_presence_of :user_id, :if => lambda {|ans| ans.answer_status == "misplaced" }
  validates_presence_of :post_id, :institution_id, :answer_status  
  
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
  
  def institutionalize_or_clear_answer_status
    if new_record? and not answer_status.present?
      self.answer_status = "institutionalized"
    elsif not new_record? and answer_status == "institutionalized"
      self.answer_status = nil
    end
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
    if answer_status == "institutionalized"
      misplaced_answer = post.answers.misplaced.last
      if misplaced_answer.present?
        misplaced_answer.answer_status = "archive"
        misplaced_answer.save
      end
    end
  end
end
