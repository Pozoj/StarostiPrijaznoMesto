class Post < ActiveRecord::Base
  belongs_to :original_post, :dependent => :destroy
  belongs_to :user, :foreign_key => "info_admin_id"
  has_many :answers, :dependent => :destroy
  #has_many :attachments, :as => :holder, :dependent => :destroy
  accepts_nested_attributes_for  :answers

  
  validates_presence_of :post_status_id
  validates_presence_of :title, :summary, :text, :post_kind_id, :sex_id, :tag_group_id
  #validates_presence_of :title, :summary, :text, :post_kind_id, :sex_id, :tag_group_id, :if => :approved_without_attachment?
  #validates_presence_of :approved_attachment, :title, :summary, :text, :post_kind_id, :sex_id, :tag_group_id, :if => :approved_with_attachment?
  
  scope :rejected,    where(:post_status_id => "rejected")
  scope :approved,    where(:post_status_id => "approved")  
  scope :comments,    where(:post_kind_id => "comment")
  scope :questions,   where(:post_kind_id => "question")
  scope :suggestions, where(:post_kind_id => "suggestion")
  scope :waiting,     where(:post_kind_id => "waiting")
  
  
  class << self
    
    # Returns all questions, that don't have an answer
    # => Unaddressed questions are posts with post_kind_id == "question" that don't have an related answer
    def unaddressed_questions
      self.approved.questions.joins("LEFT JOIN answers ON posts.id = answers.post_id").where("answers.id IS NULL") #.order("created_at DESC")
    end

    # Returns all questions, that have an answer with institution_id and answer_status = 'institutionalized'
    # => Addressed questions are posts with post_kind_id == "question" that have an related answer that's been institutionalized
    def addressed_questions
      self.approved.questions.joins("LEFT JOIN answers ON posts.id = answers.post_id").where("answers.id IS NOT NULL AND answers.answer_status = 'institutionalized'").order("created_at DESC")
    end
    
    # Returns all questions, that have an answer with answer_status = 'answered'
    # => questions are ordered 
    def answered_questions
      self.approved.questions.joins("LEFT JOIN answers ON posts.id = answers.post_id").where("answers.answer_status = 'answered'").order("answers.updated_at DESC")
    end
    
  end # class << self

  #def note
  #  original_post.note
  #end

  def approved_without_attachment?
    status.approved? and not attachment_added?
  end
  
  def approved_with_attachment?
    status.approved? and attachment_added?
  end
  
  def rejected?
    status.rejected?
  end
  
  def attachment_added?
    original_post.present? and original_post.attachment_added?
  end

  def attachment_pdf?
    if original_post.present? and original_post.attachment_added?

    end
  end

  def attachments
    if original_post.present? and original_post.attachment_added?
      return original_post.attachments.all
    end
  end

  def attachment
    if original_post.present? and original_post.attachment_added?
      return original_post.attachment
    end
  end
  
  def attachment_name
    attachment.attachment_file_name
  end
  
  def answer
    @answer ||= answers.answered.last
  end
  
  def answered?
    @answered ||= answer.present?
  end
  
  def misplaced?
     @misplaced ||= answers.misplaced.present? and not answers.answered.present?
  end
  
  def waiting?
     @waiting ||= answers.waiting.present?
  end
  
  def last_answer
    answers.order(:id).last
  end

  def answered_by
    if answer.present?
      answers.order(:id).first.institution
    else
      ""
    end
  end

  def answered_at
    if answer.present?
      answer.answered_at
    else
      ""
    end
  end

  def forwarded_at
    if answer.present?
      answer.institutionalized_at
    else
      ""
    end
  end
  
  def responsible_institution
    answers.last.institution
  end
  
  def kind
    @kind ||= PostKind.find(post_kind_id)
  end
  
  def kind=(pk)
    self.post_kind_id = PostKind.find(pk).id if PostKind.find(pk)
  end
  
  def sender
    original_post.sender if original_post.present?
  end
  
  def sex
    @sex ||= Sex.find(sex_id)
  end
  
  def sex=(sx)
    self.sex_id = Sex.find(sx).id if Sex.find(sx)
  end
  
  # Returns a PostStatus instance
  def status
    @status ||= PostStatus.find(post_status_id)
  end
  
  def tag_group
    @tag_group ||= TagGroup.find(tag_group_id)
  end
  
  def tag_group=(tg)
    self.tag_group = TagGroup.find(tg).id if TagGroup.find(tg)
  end
  
  def to_s
    title
  end
end
